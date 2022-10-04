# IITD - Scene Text Recognition and Optical Character Recognition
## Hindi - Scene Text Recognition (Word Level)
### [Docker-Image](https://hub.docker.com/repository/docker/iitdnltm/str)
- Pull the docker image: `docker push iitdnltm/str:iitd_hin`
- Download weights_hin.ckpt in mounted_volume/model 
- Download the demo.zip and extract in mounted_volume/data
- run usage_scrips/load.sh to load the docker image into a container


```bash
./usage_scripts <modality> <language> <version> <full path to image dir>

# example`
./usage_scripts scene_text hindi v1 /home/username/data/demo
```

## English - Scene Text Recognition (Word Level)
### [Docker-Image](https://hub.docker.com/repository/docker/iitdnltm/str)
- - Pull the docker image: `docker push iitdnltm/str:iitd_eng`
- Download weights_eng.ckpt in mounted_volume/model 
- Download the demo.zip and extract in mounted_volume/data
- run usage_scrips/load.sh to load the docker image into a container


```bash
./usage_scripts <modality> <language> <version> <full path to image dir>

# example`
./usage_scripts scene_text english v1 /home/username/data/demo
```


## Urdu - Optical Character Recognition (Line level)
### [Docker-Image](https://hub.docker.com/repository/docker/iitdnltm/ocr)
- Pull the docker image: `docker push iitdnltm/ocr:iitd_urdu`
- Download weights_urdu.ckpt in mounted_volume/model 
- Download the demo.zip and extract in mounted_volume/data
- run usage_scrips/load.sh to load the docker image into a container


```bash
./usage_scripts <modality> <language> <version> <full path to image dir>

# example`
./usage_scripts printed urdu v1 /home/username/data/demo
```


