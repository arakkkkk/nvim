param(
  [string]$Out = (Join-Path $PSScriptRoot "screenshot.png"),
  [string]$Model = "llama3.2-vision",  # 例: "llava:latest" でも可 (画像対応モデル)
  [string]$Endpoint = "http://localhost:11434/api/chat"
)

# 1) 画面スクリーンショットをPNGで保存（Windowsのみ）
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$bounds = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
$bmp = New-Object System.Drawing.Bitmap($bounds.Width, $bounds.Height)
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.CopyFromScreen($bounds.Location, [System.Drawing.Point]::Empty, $bmp.Size)
$bmp.Save($Out, [System.Drawing.Imaging.ImageFormat]::Png)
$g.Dispose()
$bmp.Dispose()

# 2) 画像をBase64化
$bytes = [System.IO.File]::ReadAllBytes($Out)
$b64 = [Convert]::ToBase64String($bytes)

# 3) Ollamaに採点を依頼（JSONだけ返すよう指示）
$prompt = 'あなたは画像評価者です。画質・構図・情報の明瞭さを10点満点で採点し、次のJSONだけを返してください: {""score"": <0-10の整数>, ""rationale"": ""短い説明""}'

$body = @{
  model = $Model
  messages = @(
    @{
      role = 'user'
      content = $prompt
      images = @($b64)
    }
  )
  stream = $false
} | ConvertTo-Json -Depth 6

try {
  $res = Invoke-RestMethod -Method Post -Uri $Endpoint -ContentType 'application/json' -Body $body
  if ($res.message -and $res.message.content) {
    $res.message.content
  } else {
    $res | ConvertTo-Json -Depth 6
  }
} catch {
  Write-Error "Ollama API 呼び出しに失敗しました: $($_.Exception.Message)"
  throw
}

