#!/bin/bash

# ��������������
cd riscv-tests 

# ����������������
for file in *; do
    # ��������������
    if [ -f "$file" ]; then
        # �������������������������� .elf
        mv "$file" "$file.elf"
    fi
done
