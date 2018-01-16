'use strict';

// const fs = require('fs');
const getSqlContentMap = require('./util/get-sql-content-map');
const { query } = require('./util/db');

// 打印脚本执行日志
const eventLog = function(err, sqlFile, index) {
  if (err) {
    console.log(
      `[ERROR] sql脚本文件: ${sqlFile} 第${index + 1}条脚本 执行失败 o(╯□╰)o ！`
    );
  } else {
    console.log(
      `[SUCCESS] sql脚本文件: ${sqlFile} 第${index +
        1}条脚本 执行成功 O(∩_∩)O !`
    );
  }
};

// 获取所有sql脚本内容
const sqlContentMap = getSqlContentMap();

// 执行建表sql脚本
const createAllTables = async () => {
  for (const key in sqlContentMap) {
    const sqlShell = sqlContentMap[key];
    // sqlShell:user_info.sql的脚本内容
    const sqlShellList = sqlShell.split(';');
    // sqlShellList:把sqlShell脚本内容分割成可单独执行的sql命令存进字符串数组

    for (const [ i, shell ] of sqlShellList.entries()) {
      if (shell.trim()) {
        const result = await query(shell);
        // 等待await 执行完毕后再执行后续操作
        if (result.serverStatus * 1 === 2) {
          eventLog(null, key, i);
        } else {
          eventLog(true, key, i);
        }
      }
    }
  }
  console.log('sql脚本执行结束！');
  console.log('请按 ctrl + c 键退出！');
};

createAllTables();
