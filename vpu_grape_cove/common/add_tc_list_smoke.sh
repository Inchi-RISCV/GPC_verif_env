#!/bin/bash

# 检查是否提供了输入目录路径
if [ $# -ne 1 ]; then
    echo "请提供输入目录路径作为参数。"
    exit 1
fi

# 获取输入目录路径
input_directory="$1"

# 定义输出文件名
output_file="tc_list_leiyutest_sim_halt"

# 清空或创建输出文件
> "$output_file"

# 遍历输入目录中的所有.elf文件
for file in "$input_directory"/*.elf
do
    # 获取文件名，去掉路径和扩展名
    filename=$(basename "$file" .elf)

    # 使用printf函数格式化输出，保证cfg字段宽度为10
    #printf "{mode=\"base_func\", tc=\"instr_test\" ,cfg=\"%-81s ,num=\"1\",fsdb=\"off\",cov=\"on\",cfg_dir=\"../tc/sequence/leiyutest\"}\n" "$filename"\" >> "$output_file"
    printf "{mode=\"base_func\", tc=\"instr_test\" ,cfg=\"%-81s ,num=\"1\",fsdb=\"off\",cov=\"on\",cfg_dir=\"../tc/sequence/leiyutest_sim_halt\"}\n" "$filename.elf"\" >> "$output_file"

done

echo "已根据输入目录中的文件更新输出文件 $output_file。"
