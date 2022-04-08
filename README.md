# Magento 2 Module Template

This is simple bash script that creates the magento 2 module in the specified directory from default template.

> :exclamation: Yes, the bash code it is just an experiment. Take it easy.

## Table of Contents

1. [Preparations](#preparations)
   1. [Debug](#debug)
   2. [All parameters](#all-parameters)
2. [Script Usage](#script-usage)
3. [Magento 2](#magento-2)

## Preparations

Set `make.sh` script executable:

```bash
sudo chmod +x make.sh
```

Run the script from current folder:

```bash
./make.sh
```

> Maybe, you will need to run it as sudo user.

`make.sh` will create `script.sh` in `bin` folder.

### Debug

If you want to see the debug output, run script with parameter:

```bash
./make.sh -v 1
```

And the script will show the list of files that it adds into one big bash script.
Also, the bundle will contain the information about each script inside.

### All parameters

Here the parameters list:

```bash
-v [0;1] - disable;enable debug, default - is disabled

-d /path/to/dir - path to directory where the bash scripts are located, default is `src` directory in this project

-s /path/to/build.sh - path (with script name) to the script that `make` will create, default `bin/script.sh` in this project
```

Of course, you can change all parameters, but pay attention on the directories inside `bin`, because it is important and keep it in your destination directory as well.

## Script Usage

After the bundle build, you can use it in simple way (for instance, from current project folder):

```bash
./bin/script.sh -d /path/to/magento1/app/code
```

That's enough for basic usage.

Script will ask you about information:

```bash
Hi! Please, fill a module data [Enter to continue]
Enter your name [John Doe]: 
Enter your email [john.doe@gmail.com]: john.doe2@gmail.com 
Link to your site []: 
Your role []: Magento Developer
PHP version [8.1.4]: 7.1.4
Magento 2 Vendor Name []: JohnDoe
Magento 2 Module Name []: SimpleModule
Composer autoload namespace (psr-4) [JohnDoe\\SimpleModule\\]: 
Composer repo name [johndoe/simplemodule]: johndoe/magento-simple-module
Composer description []: Test Description
Choose license [osl-3.0]: mit
Code Owner []: @johndoe
```

*[More Details Here](./docs/usage.md)*

## Magento 2

*[Magento 2 Template](./docs/magento.md)*
