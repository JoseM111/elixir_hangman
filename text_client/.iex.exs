timestamp = fn ->
  {_date, {hour, minute, _second}} = :calendar.local_time
  [hour, minute]
  |> Enum.map(&(String.pad_leading(Integer.to_string(&1), 2, "0")))
  |> Enum.join(":")
end

global_settings = "~/.iex.exs"
if File.exists?(global_settings), do: Code.require_file(global_settings)

Application.put_env(:elixir, :ansi_enabled, true)
IEx.configure(
 colors: [
    syntax_colors: [
      number: :light_yellow,
      atom: :light_cyan,
      string: :blue,
      boolean: :red,
      nil: [:magenta, :bright],
    ],
    ls_directory: [:red, :bright],
    ls_device: :yellow,
    doc_code: [:blue, :bright],
    doc_inline_code: [:magenta, :bright],
    doc_headings: [:cyan, :underline],
    doc_title: [:cyan, :bright, :underline],
  ],
 default_prompt: [
   "\e[G", # cursor ⇒ column 1
    IO.ANSI.bright, :blue, "%prefix",
    :yellow, "|",
    IO.ANSI.magenta, timestamp.(),
    IO.ANSI.bright, IO.ANSI.red, "➥",
    IO.ANSI.white, IO.ANSI.bright, "@josemartinez",
    :yellow, "|",
    :blue,
    IO.ANSI.bright, "%counter", " ",
    IO.ANSI.bright, :yellow, "▶",
    :reset
  ] |> IO.ANSI.format |> IO.chardata_to_string,
  #############
  alive_prompt:
    "#{IO.ANSI.bright}#{IO.ANSI.green}%prefix#{IO.ANSI.reset} " <>
    "(#{IO.ANSI.yellow}%node#{IO.ANSI.reset}) " <>
    "[#{IO.ANSI.bright}#{IO.ANSI.magenta}#{timestamp.()}#{IO.ANSI.reset} " <>
    ":: #{IO.ANSI.cyan}%counter#{IO.ANSI.reset}] >",
  history_size: 50,
  inspect: [
    pretty: true,
    limit: :infinity,
    width: 80
  ],
  width: 80
)
