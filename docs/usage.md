# Script usage

## Table of Contents

1. [Dependencies](#dependencies)
2. [All parameters](#all-parameters)
3. [Variables list](#variables-list)
4. [Default values](#default-values)
5. [Combine Parameters](#combine-parameters)
   1. [Simplest usage](#simplest-usage)
   2. [Set-up settings file](#set-up-settings-file)
   3. [Non-interactive mode](#non-interactive-mode)
   4. [Change source directory](#change-source-directory)
6. [Licenses](#licenses)

## Dependencies

The bundle script depends on [`jq`](https://stedolan.github.io/jq/) that is located in `vendor` folder.

`jq` uses for parsing an answers from [GitHub API](#licenses).

All script moves from `vendor` to `bin` directory with bundle script that uses them.

## All parameters

```bash
-s /path/to/source/dir - path to the template source dir, default - `tpl` directory in the project root

-d /path/to/destination/dir - path to destination directory where a module will be put, is required parameter, for instanse `/path/to/projects/magento2/src/spp/code/`

-f /path/to/file/project.ini - path to settings file with default values, default is empty - script doesn't use file

-n [0;1] - disable;enable non-interactive mode, default is `0` - mean the scripts runs in interactive mode
```

## Variables list

| Variable Name          | Code                                     | Default Value                                 | Usage Examples                                                                                                                                     |
|------------------------|------------------------------------------|-----------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
| User Name              | `%{{AUTHOR_NAME}}%`                      | `git config --get user.name`                  | In `composer.json` authors.name                                                                                                                    |
| User Email             | `%{{AUTHOR_EMAIL}}%`                     | `git config --get user.email`                 | In `composer.json` authors.email                                                                                                                   |
| User Homepage          | `%{{AUTHOR_HOMEPAGE}}%`                  | -                                             | In `composer.json` authors.homepage                                                                                                                |
| User Role              | `%{{AUTHOR_ROLE}}%`                      | -                                             | In `composer.json` authors.role                                                                                                                    |
| PHP Version            | `%{{PHP_VERSION}}%`                      | `php -r "echo PHP_VERSION;"`                  | In `composer.json` require                                                                                                                         |
| Magento 2 Vendor Name  | `%{{M2_VENDOR}}%`                        | -                                             | Is the directory name in `app/code` for Magento 2, in `composer.json` as default value for repository name prefix, in `README.md`, in `module.xml` |
| Magento 2 Module Name  | `%{{M2_VENDOR_MODULE}}%`                 | -                                             | Is the directory name in `app/code/Vendor` for Magento 2, in `module.xml` and same as vendor name                                                  |
| Autoload               | `%{{COMPOSER_AUTOLOAD_NAMESPACE}}%`      | `%{{M2_VENDOR}}%\\%{{M2_VENDOR_MODULE}}%")\\` | In `composer.json` for autoload.psr-4                                                                                                              |
| Repository Name        | `%{{GIT_REPO_NAME}}%`                    | `%{{M2_VENDOR}}%/%{{M2_VENDOR_MODULE}}%`      | `composer.json` - name                                                                                                                             |
| Repository Description | `%{{COMPOSER_DESCRIPTION}}%`             | -                                             | `composer.json` - description                                                                                                                      |
| License Data           | `%{{LICENSE_SET}}%` `%{{LICENSE_CODE}}%` | License code is `osl-3.0` by default          | In `composer.json` and license text will pass into `LICENSE.txt` file                                                                              |
| Code Owner             | `%{{CODE_OWNER}}%`                       | -                                             | In `CODEOWNERS` file for GitHub                                                                                                                    | 

## Default values

Some values the script gets from [environment](#variables-list).

But you can use special settings file that will override the default values.

The example file is `project.ini.example`:

```ini
[author]
name = ""
email = ""
homepage = ""
role = ""

[php]
version = ""

[magento]
vendor_name = ""
module_name = ""

[composer]
autoload = ""
repo_name = ""
repo_description = ""

[other]
license = "osl-3.0"
code_owner = ""
```

If you need this file, therefore copy `project.ini.example` to `project.ini` (or set name that you prefer).

Now you can fill any values and use this file [as parameter in script](#set-up-settings-file).

## Combine Parameters

### Simplest usage

Default usage looks like it:

```bash
./bin/script.sh -d /path/to/magento1/app/code
```

In this case, the script will ask you about values:

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

### Set-up settings file

If you don't want to fill the values each time, like name, email etc., you can fill the [`project.ini` file](#default-values).

Every time you will run the script it already will have default values from the file.

For instance, file:

```ini
[author]
name = "Andrii Prakapas"
email = "my-email@mail.com"
homepage = "https://github.com/marsskom"
role = "PHP Developer"

[php]
version = "7.4"

[magento]
vendor_name = "Marsskom"
module_name = "FirstModule"

[composer]
autoload = "Marsskom\\FirstModule\\"
repo_name = "marsskom/magento-first-module"
repo_description = "This is my first module"

[other]
license = "mit"
code_owner = "@marsskom"
```

Run script:

```bash
./bin/script.sh -d /path/to/magento1/app/code -f project.ini
```

Values:

```bash
Hi! Please, fill a module data [Enter to continue]
Enter your name [Andrii Prakapas]: 
Enter your email [my-email@mail.com]: 
Link to your site [https://github.com/marsskom]: 
Your role [PHP Developer]: 
PHP version [7.4]: 
Magento 2 Vendor Name [Marsskom]: 
Magento 2 Module Name [FirstModule]: 
Composer autoload namespace (psr-4) [Marsskom\\FirstModule\\]: 
Composer repo name [marsskom/magento-first-module]: 
Composer description [This is my first module]: 
Choose license [mit]: 
Code Owner [@marsskom]:
```

Definitely, you can override any value:

```bash
Hi! Please, fill a module data [Enter to continue]
Enter your name [Andrii Prakapas]: Marsskom
Enter your email [my-email@mail.com]: my-email+for.project@gmail.com
Link to your site [https://github.com/marsskom]: 
Your role [PHP Developer]: 
PHP version [7.4]: 8.1
Magento 2 Vendor Name [Marsskom]: 
Magento 2 Module Name [FirstModule]: SecondModule
Composer autoload namespace (psr-4) [Marsskom\\FirstModule\\]: Marsskom\\SecondModule
Composer repo name [marsskom/magento-first-module]: marsskom/magento-second-module
Composer description [This is my first module]: 
Choose license [mit]: bsd-3-clause-clear
Code Owner [@marsskom]: 
```

Or run the script in [non-interactive mode](#non-interactive-mode).

### Non-interactive mode

You can run script in non-interactive mode if you have the [settings file](#set-up-settings-file), for instance:

```ini
[author]
name = "Andrii Prakapas"
email = "my-email@mail.com"
homepage = "https://github.com/marsskom"
role = "PHP Developer"

[php]
version = "7.4"

[magento]
vendor_name = "Marsskom"
module_name = "FirstModule"

[composer]
autoload = "Marsskom\\FirstModule\\"
repo_name = "marsskom/magento-first-module"
repo_description = "This is my first module"

[other]
license = "mit"
code_owner = "@marsskom"
```

Run script:

```bash
./bin/script.sh -d /path/to/magento1/app/code -f project.ini -n 1
```

So the script doesn't ask any values, just will show the result:

```bash
Name: Andrii Prakapas
Email: my-email@mail.com
Homepage: https://github.com/marsskom
Role: PHP Developer
PHP version: 7.4
Magento 2 Vendor Name: Marsskom
Magento 2 Module Name: FirstModule
Autoload (psr-4): Marsskom\\FirstModule\\
Composer repo name: marsskom/magento-first-module
Composer description: This is my first module
License: mit
Code Owner: @marsskom
```

### Change source directory

Of course, you can change the source directory and the script will copy your directory and will try to replace all [variables](#variables-list) by their values in each file.

OK. Have fun!

## Licenses

All license codes must be compatible with [GitHub list](./license/list.md).

Because the script automatically gets license text and label through [GitHub API](https://docs.github.com/en/rest/reference/licenses).
