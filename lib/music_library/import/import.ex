defmodule MusicLibrary.Import do
  @moduledoc """
  The Import context.
  """

  alias MusicLibrary.Import.CollectInfo

  def collect_info(path) do
    if File.exists?(path) do
      import_info = scan_cue_files(path) || scan_media_files(path)
    else
      "Path not exist!"
    end
  end

  defp scan_cue_files(path) do
    Enum.each(Path.wildcard(Path.join(path, "**/*.cue")), fn(cue) -> process_cue(cue) end)
  end

  defp process_cue(cue_file) do
    cue_file
  end

  defp scan_media_files(path) do
    path
  end
end
