# zipto
Simple shell script to compress data in a directory into a desired location

## Example
**Source:**

    SRC_PATH
      |-->Music
      |      |-->file1.mp3
      |      |-->file2.mp3
      |-->Pictures
      |      |-->pic1.jpg
      |-->info1.txt
      |-->info2.doc
      |-->info3.pdf

**Result:**

    DST_PATH
      |-->Music.zip
      |-->Pictures.zip
      |-->SRC_PATH.zip (top level files: info1.txt, info2.doc, info3.pdf)

## Instalation
```shell
$ sudo curl -fLo /usr/local/bin/zipto https://raw.githubusercontent.com/swordf1zh/zipto/main/zipto.sh
$ sudo chmod +x /usr/local/bin/zipto
```

## Usage
```shell
$ zipto [DST_PATH] [SRC_PATH]
```

