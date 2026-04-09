# JSST2026 Template

JSST2026 の国際学会プロシーディングス向け LaTeX テンプレートです。

## ローカルビルド

`uplatex + upbibtex + dvipdfmx` を前提に `latexmk` で PDF を生成します。

```powershell
latexmk -r latexmkrc -pdfdvi JSST2026_Template.tex
```

生成物は `JSST2026_Template.pdf` です。中間ファイルを削除する場合は次を実行します。

```powershell
latexmk -r latexmkrc -c JSST2026_Template.tex
```

## GitHub Actions

`.github/workflows/template-pdf.yml` で以下を自動化します。

- pull request と push でテンプレート PDF をビルド
- Actions artifact として PDF を保存
- `main` または `master` への push 時に GitHub Release の asset を更新

最新版 PDF の固定 URL:

`https://github.com/uedasan/JSST2026-Unofficial-Template/releases/download/template-pdf-latest/JSST2026_Template.pdf`
