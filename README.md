# Grid

Automic Installer For Linux.  

To make life more easier.  

# Project Structure

```
./grid
|-- LICENSE
|-- README.md
|-- checker
|   `-- Checker.sh
|-- common
|   |-- Color.sh
|   |-- CommonFunction.sh
|   `-- Prefix.sh
|-- configurator
|   `-- configurator.sh
|-- decompressor
|-- downloader
|-- installer
|   |-- InstallerAdaptor.sh
|   |-- centos
|   |   |-- CentOSInstaller.sh
|   |   `-- soft
|   `-- ubuntu
|       `-- UbuntuInstaller.sh
|-- logger
|   |-- Logger.sh
|   `-- ProgressBar.sh
|-- pop-soft
`-- run.sh
```

# NOTICE

Please make sure to set git to ignore chmod changes

```
git config core.filemode false
git config --global core.filemode false
```

