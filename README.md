# 🎓 北京交通大学本科生毕业论文 LaTeX 模板

## 📌 简介

网上虽然有各种北交大非官方的模板，但是格式与学校的word都略有差别，本模板严格参照北京交通大学计算机学院的本科生毕业论文Word模板编写，旨在为学弟学妹们提供便利。

如果您发现格式问题，或是增加模板功能，欢迎提交issue和pr！

本模板基于 [https://github.com/billhu0228/BJTUThesisTemplete](https://github.com/billhu0228/BJTUThesisTemplete) 的模板修改而来，对很多部分进行了修改并对整体的结构做了调整。其下面介绍本模板的使用方法。

---

## 🛠️ 使用

* Overleaf 是一个线上 LaTeX 编辑器，可以在不安装任何工具的情况下编写 LaTeX 文档，同时也可以和其他人共享文档，共同编辑。
* 本地编译比 Overleaf 更快，而且本地编译可以使用 Git 来记录版本。推荐有能力的同学设置本地编译环境，并推荐使用 Visual Studio Code 配合 LaTeX Workshop 插件。

---

## ⚙️ 可选参数

| **参数名称**          | **选项一**                         | **选项二**                 |
| ----------------- | ------------------------------- | ----------------------- |
| `TwoSide`         | `true`: 章节末的偶数页留白，保证下章节的标题位于奇数页 | `false`: 取消偶数页留白        |
| `BlindReview`     | `true`: 生成盲审用 pdf（隐藏个人信息）       | `false`: 生成提交用 pdf      |
| `NumberByChapter` | `true`: 正文中的图片、表格、公式按章节编号       | `false`: 正文图片、表格、公式全局编号 |

---

## ✅ 编译方式

### 🖥️ A. 服务器/本地测试步骤（推荐 TeX Live + VSCode 或命令行）：

1. 确保你已经安装：

   * TeX Live（含 `xelatex` 和 `biber`）
   * `latexmk`

2. 在你的项目根目录打开终端，运行：

   ```bash
   latexmk -xelatex -shell-escape -bibtex bjtuthesis.tex
   ```

   或者让 `.latexmkrc` 控制一切，直接：

   ```bash
   latexmk bjtuthesis.tex
   ```

3. 成功后，会自动生成 `bjtuthesis.pdf`（或你的主 `.tex` 文件名对应的 PDF）。

---

### 🧪 B. 本地测试步骤（使用 TeXstudio）

1. 打开你的主 `.tex` 文件，例如：`bjtuthesis.tex`

2. 点击 **选项 -> 设置TeXstudio -> 构建**

   * 默认编译器选择 `XeLaTex`
   * 默认文献工具选择 `BiBer`

3. 点击工具栏上的绿色箭头（`构建 & 查看`）【或是按`F5`】

4. 如果文献没有显示，选择最上方的 `工具(T)`，点击 `参考文献(B)` 运行 biber 【或是按`F8`】

5. 再运行两次 XeLatex，即点击工具栏上的绿色箭头（`构建 & 查看`）【或是按 `F5`】两次

📌 **快捷方式建议：** 依次按 `F5 - F8 - F5 - F5` 即可成功编译

---

### ☁️ C. Overleaf 测试步骤
1. 将整个文件打包压缩然后上传至Overleaf
2. 打开本项目
3. `Ctrl+S` 保存或是点击绿色 `ReCompile` 进行编译
4. Overleaf 会自动读取 `.latexmkrc` 运行编译链（`xelatex → biber → xelatex → xelatex`）

---

## 🧹 清理中间文件（可选）

终端运行：

```bash
latexmk -c
```

---

## 🔢 统计字数

### 🖥️ A. 使用 bash 运行 `word_count.sh` 文件

1. 打开终端（Windows 建议使用 Git Bash 或 WSL + VS Code），切换到项目目录：

   ```bash
   cd path\to\your\project
   ```

2. 执行脚本：

   ```bash
   ./scripts/word_count.sh bjtuthesis.tex
   ```

3. 输出说明：

   * 控制台显示简要统计数据
   * 结果输出到 `outputs\bjtuthesis.wordcnt`

---

### 🖥️ B. 使用 PowerShell 运行 `word_count.ps1` 文件

1. 打开终端，切换到项目目录：

   ```bash
   cd path\to\your\project
   ```

2. 执行脚本：

   ```bash
   ./scripts/word_count.ps1 bjtuthesis.tex
   ```

3. 输出说明：

   * 控制台显示简要统计数据
   * 结果输出到 `outputs\bjtuthesis.wordcnt`

---

## 🧰 Makefile 用法

Makefile 集成了编译、清理中间文件、打开生成的 PDF 三个步骤。请不要修改主 `.tex` 文件名。

### 📌 用法说明：

* `make` → 等同于 `make all`，先清理再编译
* `make bjtuthesis` → 只编译
* `make clean` → 清理中间文件
* `make view` → 打开生成的 PDF

---

## 📄 版权

本项目基于 MIT 协议开源，除学校标志的版权归北京交通大学所有外，您可以随意使用。

---

## 🌟 其他

如果您觉得本模板有用，请考虑 ⭐Star 本仓库！

---

