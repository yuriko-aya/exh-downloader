## exh-downloader
Simple bash script for downloading manga/doujin image from exhentai.org
Instead of creating a zip file, this program will create folder with gallery title name dan download the image into it.

## Requirements
* html-xml-utils
* lynx
* wget

## Instalation
```bash
git clone https://github.com/yuriko-aya/exh-downloader.git
cd ex-downloader
bash install.sh
```
**Although this script can run, I recommend to replace exhentai.cookie inside $HOME/.xhdownloader/ with your own cookie**
you can get it by exporting your browser cookie as plain text and save it.

## Usage
```
exh-downloader gallerylink
```

