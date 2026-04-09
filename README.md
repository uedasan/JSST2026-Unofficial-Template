# JSST2026 Unofficial Template

JSST2026 の国際学会プロシーディングス向け LaTeX テンプレートを、GitHub Actions で再現可能にした非公式リポジトリです。

このリポジトリは公式配布元ではありません。テンプレート本体の内容は元の配布物をベースにしつつ、ビルド自動化と配布導線を追加しています。

公式サイト:
[https://jsst-conf.jp/2026/](https://jsst-conf.jp/2026/)

## Latest PDF

[Download the latest PDF](https://github.com/uedasan/JSST2026-Unofficial-Template/releases/download/template-pdf-latest/JSST2026_Template.pdf)

上のリンクは GitHub Release の固定 URL で、`main` への push 後に最新ビルドへ更新されます。

## Repository Contents

- `JSST2026_Template.tex`: テンプレート本文
- `jasse.cls`: クラスファイル
- `jasse.bst`: BibTeX スタイル
- `JSST2026_refs.bib`: 参考文献サンプル
- `latexmkrc`: ローカル / CI 共通のビルド設定
- `.github/workflows/template-pdf.yml`: PDF 自動ビルドと Release 更新

## Local Build

このリポジトリは `uplatex + upbibtex + dvipdfmx` を前提に `latexmk` で PDF を生成します。

```powershell
latexmk -r latexmkrc -pdfdvi JSST2026_Template.tex
```

生成物は `JSST2026_Template.pdf` です。中間ファイルを削除する場合:

```powershell
latexmk -r latexmkrc -c JSST2026_Template.tex
```

## GitHub Actions

`.github/workflows/template-pdf.yml` は次を自動化します。

- pull request と push でテンプレート PDF をビルド
- Actions artifact として PDF を保存
- `main` または `master` への push 時に GitHub Release の `template-pdf-latest` を更新

## Notes

- `JSST2026_Template.pdf` は生成物なので Git 管理していません
- テンプレートの見た目を変えない方針で、クラスファイルの版面設定は原則オリジナル準拠です
- このリポジトリはほとんどLLMがつくりました。
