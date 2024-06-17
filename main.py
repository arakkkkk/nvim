import re

def text2obj(text):
  """
  テキストをオブジェクトのリストに変換する関数

  Args:
    text: テキスト

  Returns:
    オブジェクトのリスト
  """
  lines = text.split("\n")
  headRegExp = re.compile(r"h(\d+)\. .+")
  paragRegExp = re.compile(r"p\(\. .+")
  res = []
  line_count = 0
  for i, line in enumerate(lines):
    if re.match(headRegExp, line):
      res.append({
        "id": i + 1,
        "head": None,
        "text": line,
        "type": "header",
        "level": int(re.match(headRegExp, line).group(1)),
        "line_count": line_count,
      })
    elif re.match(paragRegExp, line):
      res.append({
        "id": i + 1,
        "head": None,
        "text": line,
        "type": "paragraph",
        "line_count": line_count,
      })
    else:
      res.append({
        "id": i + 1,
        "head": None,
        "text": line,
        "type": "text",
        "line_count": line_count,
      })
    line_count += len(line) + 1
  return res

def parseTextile(lines, level, head_id, res=[], watched=[]):
  """
  テキストオブジェクトのリストを解析する関数

  Args:
    lines: テキストオブジェクトのリスト
    level: 現在のレベル
    head_id: 親ヘッダーのID
    res: 解析結果のリスト
    watched: 処理済みのオブジェクトのIDリスト

  Returns:
    解析結果のリスト
  """
  for i, line in enumerate(lines):
    if line["id"] in watched:
      continue
    if line["type"] == "header":
      if line["level"] == level:
        watched.append(line["id"])
        line["head"] = head_id
        res.append(line)
        parseTextile(lines, level + 1, line["id"], res, watched)
      elif line["level"] < level:
        return
    elif line["type"] == "paragraph":
      watched.append(line["id"])
      line["head"] = head_id
      res.append(line)

# テキスト例
text = """
h1. Header1

title

h2. Header2

p(. paragraph1

p(. paragraph2

h3. Header3

h2. Header2
"""

# テキストをオブジェクトに変換
objects = text2obj(text)

# オブジェクトを解析
parseTextile(objects, 1, None, objects)

# 解析結果を出力
print(objects)
