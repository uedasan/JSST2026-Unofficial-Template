# Unofficial Modern JSST2026 Template: jasse-modern

JSST2026 向け LaTeX テンプレートを、`jasse-modern` クラスとして整理した非公式リポジトリです。

このリポジトリは公式配布元ではありません。元の配布物をベースにしつつ、古い記法の整理、LuaLaTeX への対応、モダンなクラス設計への移行を目的に作成しています。

オリジナルのテンプレートは公式サイトにあります。JSST2026はこのテンプレートを公式にサポートしていません。投稿時はJSST2026の投稿規程に従ってください。

JSST2026公式サイト:
[https://jsst-conf.jp/2026/](https://jsst-conf.jp/2026/)

## Automated Build Flow & Latest PDF
GitHub Actionsを利用して、`main` ブランチへの push 後に最新版を自動ビルドします。最新の PDF は次のリンクからダウンロードできます。

[Download the latest PDF](https://github.com/uedasan/JSST2026-Unofficial-Template/releases/download/template-pdf-latest/JSST2026_Template.pdf)


## Repository Contents

- `jasse-modern.cls`: `journal` / `proceedings` の両 mode を持つ modern class
- `JSST2026_Template_modern.tex`: `journal` / `proceedings` を切り替えて使う sample .tex file
- `jasse.bst`: BibTeX スタイル
- `JSST2026_refs.bib`: 参考文献サンプル
- `latexmkrc`: `jasse-modern` の既定ビルド設定


## Switch Build Mode

[jasse-modern.cls](d:/JSST/JSST2026/JSST2026-Template_bib/jasse-modern.cls) は、1 本のソースファイルから `proceedings` / `journal` の 2 モードを切り替えて使う想定です。
`proceedings` は JSST2026 プロシーディングス用、`journal` は JASSE の特集号にフルペーパーで投稿するときに使います。

サンプル [JSST2026_Template_modern.tex](d:/JSST/JSST2026/JSST2026-Template_bib/JSST2026_Template_modern.tex) の先頭で、`journal` / `proceedings` のどちらかを有効にして使います。
```tex
\documentclass[proceedings]{jasse-modern}
```

または

```tex
\documentclass[journal]{jasse-modern}
```

## Local Build

既定では upLaTeX でビルドします:

```powershell
latexmk JSST2026_Template_modern.tex
```

LuaLaTeX でビルドすることもできます:

```powershell
latexmk -lualatex JSST2026_Template_modern.tex
```

## Major Features of jasse-modern

- `proceedings` / `journal` の mode 切替
- `\JasseSetup{...}` によるメタデータの key-value 設定
- `links` オプションによるリンク有効化

## Notes

- `jasse-modern` は非公式テンプレートです。見た目を大きく崩さずに使い勝手とビルド性を改善することを目的にしています
- 参考文献は既定で `BibTeX + jasse.bst` を使います
- `\JasseSetup{...}` で `no` と `number` の両方を指定した場合は、後に書いた値が優先されます
- `links` を付けない既定設定では、URL は表示のみで、クリック可否は PDF viewer 側の自動判定に依存します
- この `jasse-modern.cls` を使用して何か問題が起きたり、JSST2026から投稿を拒否されても作成者はいかなる責任も負いません。
