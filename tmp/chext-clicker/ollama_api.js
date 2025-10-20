(() => {
  const ENDPOINT = "http://localhost:11434/api/generate";
  const MODEL = "llama3.1:8b";

  function getPrompt(el) {
    const tag = el?.tagName?.toLowerCase?.() || "unknown";
    const text = (el?.innerText || el?.textContent || "")
      .trim()
      .replace(/\s+/g, " ")
      .slice(0, 120);
    const href = el?.getAttribute?.("href") || "";
    return [
      "次の要素をクリックしたときに起きそうなことを、日本語で一文で簡潔に説明してください。",
      `タグ: ${tag}`,
      text && `テキスト: ${text}`,
      href && `リンク: ${href}`,
    ]
      .filter(Boolean)
      .join("\n");
  }

  async function describe(el) {
    const prompt = getPrompt(el);
    return "api ok";
    try {
      const res = await fetch(ENDPOINT, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ model: MODEL, prompt, stream: false }),
      });
      const data = await res.json().catch(() => ({}));
      return data && data.response ? String(data.response).trim() : "";
    } catch (e) {
      return "";
    }
  }

  window.__ollamaApi = { describe };
})();
