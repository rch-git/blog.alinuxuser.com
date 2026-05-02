---
date: {{ time .Date | time.Format "2006-01-02T15:04:05" }}
draft: false
title: '{{ replace .File.ContentBaseName "-" " " | title }}'
---
