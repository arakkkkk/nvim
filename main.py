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
    for i, line in enumerate(lines):
        if re.match(headRegExp, line):
            res.append(
                {
                    "id": i + 1,
                    "head": None,
                    "text": line,
                    "type": "header",
                    "level": int(re.match(headRegExp, line).group(1)),
                    "start_num": i + 1,
                }
            )
        elif re.match(paragRegExp, line):
            res.append(
                {
                    "id": i + 1,
                    "head": None,
                    "text": line,
                    "type": "paragraph",
                    "start_num": i + 1,
                }
            )
        else:
            pass
            # res.append({
            #   "id": i + 1,
            #   "head": None,
            #   "text": line,
            #   "type": "text",
            # })
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
                parseTextile(lines, level + 1, line["id"], res, watched)
            elif line["level"] < level:
                return
        elif line["type"] == "paragraph":
            watched.append(line["id"])
            line["head"] = head_id


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
print(len(objects))

# オブジェクトを解析
parseTextile(objects, 1, None, objects)
print(len(objects))

# 解析結果を出力
for o in objects:
    print(o)
