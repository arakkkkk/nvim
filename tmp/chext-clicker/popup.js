(() => {
  const toggleBtn = document.getElementById("toggle");
  const statusEl = document.getElementById("status");

  function render(enabled) {
    if (enabled) {
      toggleBtn.textContent = "ON";
      toggleBtn.classList.add("on");
      toggleBtn.classList.remove("off");
      toggleBtn.setAttribute("aria-pressed", "true");
      statusEl.textContent = "有効";
    } else {
      toggleBtn.textContent = "OFF";
      toggleBtn.classList.add("off");
      toggleBtn.classList.remove("on");
      toggleBtn.setAttribute("aria-pressed", "false");
      statusEl.textContent = "無効";
    }
  }

  // 初期表示
  chrome.storage.local.get({ enabled: false }, ({ enabled }) => {
    render(Boolean(enabled));
  });

  // トグル
  toggleBtn.addEventListener("click", () => {
    chrome.storage.local.get({ enabled: false }, ({ enabled }) => {
      const next = !enabled;
      chrome.storage.local.set({ enabled: next }, () => render(next));
    });
  });
})();
