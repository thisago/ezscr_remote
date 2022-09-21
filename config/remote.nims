proc main*(params: seq[string]): bool =
  ## This script will download the script file (first parameter) and run it
  ## without creating any file.
  result = true
  if params.len == 0:
    echo "Provide the script url"
    return false
  let req = params[0].httpGet
  if req.code != 200:
    echo "The script doesn't exists"
    return false
  echo req.body
