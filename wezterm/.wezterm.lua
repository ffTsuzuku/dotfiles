local wezterm = require 'wezterm'
local act = wezterm.action

local function paste_image_or_text(window, pane)
  local is_darwin = wezterm.target_triple:find('darwin') ~= nil
  local is_windows = wezterm.target_triple:find('windows') ~= nil
  local is_linux = wezterm.target_triple:find('linux') ~= nil

  -- 1. macOS Host
  if is_darwin then
    local jxa_script = [[
      ObjC.import("AppKit");
      function run() {
        var pb = $.NSPasteboard.generalPasteboard;
        var classes = $.NSArray.arrayWithObject($.NSImage.class);
        if (pb.canReadObjectForClassesOptions(classes, $())) {
          var objects = pb.readObjectsForClassesOptions(classes, $());
          if (objects.count > 0) {
            var image = objects.objectAtIndex(0);
            var tiffData = image.TIFFRepresentation;
            var bitmap = $.NSBitmapImageRep.imageRepsWithData(tiffData).objectAtIndex(0);
            var pngData = bitmap.representationUsingTypeProperties($.NSBitmapImageFileTypePNG, $());
            var path = "/tmp/clipboard_" + Date.now() + ".png";
            if (pngData.writeToFileAtomically(path, true)) {
              return path;
            }
          }
        }
        return "";
      }
    ]]

    local success, stdout = wezterm.run_child_process({
      'osascript',
      '-l',
      'JavaScript',
      '-e',
      jxa_script,
    })

    local saved_path = stdout and stdout:gsub('[\r\n]', '') or ''
    if success and saved_path ~= '' then
      window:perform_action(act.SendString(saved_path), pane)
      return
    end

  -- 2. Windows Host (with WSL path conversion)
  elseif is_windows then
    local ps_script = [[
      Add-Type -AssemblyName System.Windows.Forms
      Add-Type -AssemblyName System.Drawing
      if ([System.Windows.Forms.Clipboard]::ContainsImage()) {
        $img = [System.Windows.Forms.Clipboard]::GetImage()
        $tempPath = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), "clipboard_" + [DateTimeOffset]::UtcNow.ToUnixTimeMilliseconds() + ".png")
        $img.Save($tempPath, [System.Drawing.Imaging.ImageFormat]::Png)
        Write-Output $tempPath
      }
    ]]

    local success, stdout = wezterm.run_child_process({
      'powershell.exe',
      '-NoProfile',
      '-Sta',
      '-Command',
      ps_script,
    })

    local saved_path = stdout and stdout:gsub('[\r\n]', '') or ''
    if success and saved_path ~= '' then
      local wsl_path = saved_path:gsub('\\', '/'):gsub('^([A-Za-z]):', function(drive)
        return '/mnt/' .. drive:lower()
      end)
      window:perform_action(act.SendString(wsl_path), pane)
      return
    end

  -- 3. Native Linux Host
  elseif is_linux then
    local tmp_path = string.format('/tmp/clipboard_%d.png', os.time())
    local sh_cmd = string.format([[
      if [ -n "$WAYLAND_DISPLAY" ] && command -v wl-paste >/dev/null 2>&1; then
        if wl-paste --list-types 2>/dev/null | grep -q "image/"; then
          wl-paste --type image/png > "%s" && echo -n "%s"
        fi
      elif [ -n "$DISPLAY" ] && command -v xclip >/dev/null 2>&1; then
        if xclip -selection clipboard -t TARGETS -o 2>/dev/null | grep -q "image/"; then
          xclip -selection clipboard -t image/png -o > "%s" 2>/dev/null && echo -n "%s"
        fi
      fi
    ]], tmp_path, tmp_path, tmp_path, tmp_path)

    local success, stdout = wezterm.run_child_process({ 'sh', '-c', sh_cmd })
    local saved_path = stdout and stdout:gsub('[\r\n]', '') or ''
    if success and saved_path ~= '' then
      window:perform_action(act.SendString(saved_path), pane)
      return
    end
  end

  -- Fallback: standard clipboard text paste
  window:perform_action(act.PasteFrom 'Clipboard', pane)
end

return {
  font_size = 11,
  font = wezterm.font("JetBrains Mono"),
  color_scheme = 'Material Darker (base16)',
  window_decorations = "RESIZE",
  hide_tab_bar_if_only_one_tab = true,
  audible_bell = "Disabled",
  window_padding = {
    left = 4,
    right = 4,
    top = 4,
    bottom = 4,
  },
  adjust_window_size_when_changing_font_size = false,
  scrollback_lines = 10000,
  keys = {
    {
      key = 'v',
      mods = 'CMD',
      action = wezterm.action_callback(paste_image_or_text),
    },
    {
      key = 'V',
      mods = 'CMD',
      action = wezterm.action_callback(paste_image_or_text),
    },
    {
      key = 'v',
      mods = 'CTRL|SHIFT',
      action = wezterm.action_callback(paste_image_or_text),
    },
    {
      key = 'V',
      mods = 'CTRL|SHIFT',
      action = wezterm.action_callback(paste_image_or_text),
    },
    {
      key = 'Insert',
      mods = 'SHIFT',
      action = wezterm.action_callback(paste_image_or_text),
    },
  },
}
