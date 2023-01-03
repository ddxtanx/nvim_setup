#!/bin/bash
code_lldb_path=$(find $HOME/.vscode/extensions -name codelldb | wc -l)

if [ $code_lldb_path -eq 0 ]
then
  if command -v code &> /dev/null
  then
    code --install-extension vadimcn.vscode-lldb@1.8.1
  else
    echo "The codelldb extension is not installed, please either install it manually or install vscode for automated installation."
    exit
  fi
fi
