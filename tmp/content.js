(() => {
  // グローバルON/OFF状態
  let enabled = false;

  // 初期状態の取得
  try {
    chrome.storage?.local.get({ enabled: false }, (res) => {
      enabled = Boolean(res.enabled);
    });
  } catch (_) {
    // chrome.storageが無い環境は常に無効扱い
    enabled = false;
  }

  // 変更監視（ポップアップでの切り替え反映）
  try {
    chrome.storage?.onChanged.addListener((changes, area) => {
      if (
        area === "local" &&
        Object.prototype.hasOwnProperty.call(changes, "enabled")
      ) {
        enabled = Boolean(changes.enabled.newValue);
      }
    });
  } catch (_) {
    // no-op
  }

  // 要素の簡易説明を生成
  function describeElement(el) {
    console.log(el);
    return el.innerText;
  }

  function calcScore(el) {
    let score = 20;
    return `Score: ${score}`;
  }

  // クリック捕捉（キャプチャ段階）
  async function onClickCapture(e) {
    if (!enabled) return;

    // ユーザー操作のみ対象（プログラム的なclickは除外）
    if (e.isTrusted === false) return;

    const target = e.target;
    // 既存のクリックは一旦ブロック
    e.stopImmediatePropagation();
    e.preventDefault();

    const desc = describeElement(target);
    const score = calcScore(target);

    // AI説明取得
    let ai = "";
    try {
      ai = await (window.__ollamaApi?.describe?.(target) ||
        Promise.resolve(""));
    } catch (_) {
      /* ignore */
    }

    // 確認ダイアログ表示
    const msg = ["クリックします。", desc, score, ai && `AI説明: ${ai}`]
      .filter(Boolean)
      .join("\n");

    // クリック処理
    const ok = confirm(msg);
    if (ok) {
      try {
        // プログラム的クリックで再実行
        if (typeof target.click === "function") {
          target.click();
        } else {
          const evt = new MouseEvent("click", {
            bubbles: true,
            cancelable: true,
          });
          target.dispatchEvent(evt);
        }
      } catch (_) {
        /* no-op */
      }
    }
    // キャンセル時は何もしない（ブロックのまま終了）
  }

  // 一度だけ登録
  document.addEventListener("click", onClickCapture, true);
})();
