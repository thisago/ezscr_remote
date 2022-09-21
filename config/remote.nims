from std/json import parseJson, add, `{}`, `{}=`, `%*`, `%`, `[]`, `$`
from std/strutils import strip, IdentChars, join
from std/strformat import fmt

func scriptName(url: string): string =
  ## Creates a name for script url by removing all special chars
  for ch in url:
    if ch in IdentChars:
      result.add ch

const data = "data.enc"

proc main*(params: seq[string]): bool =
  ## This script will download the script file (first parameter) and run it
  ## without creating any file.
  result = true
  if params.len == 0:
    echo "Provide the script url"
    return false
  let
    url = params[0]
    name = scriptName url
    req = url.httpGet

  var scrParams: seq[string]
  for param in params[1..^1]:
    scrParams.add "\"" & param & "\""

  if req.code != 200:
    echo "The script doesn't exists"
    return false
  var
    scripts = parseJson decrypt readFile data
    script = %*{
      "name": name,
      "content": req.body,
      "alias": ""
    }
  script{"secret"} = %false
  scripts{"scripts"}.add script
  data.writeToFile encrypt $scripts

  exec fmt"ezscr run {name} " & scrParams.join " "

  scripts{"scripts"} = scripts{"scripts"}[0..^2]
  data.writeToFile encrypt $scripts
