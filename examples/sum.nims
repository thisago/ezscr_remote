from std/strutils import parseFloat

proc main*(params: seq[string]): bool =
  ## The EzScr will run this automatically
  result = true
  try:
    var res = 0.0
    for param in params:
      res += parseFloat param
    echo res
  except ValueError:
    result = false
    echo "Invalid number"
