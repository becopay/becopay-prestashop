# Docker image for Prestashop 1.7 with Becopay gateway


### Quick start

The easiest way to start Prestashop 1.7 with MySQL is using [Docker Compose](https://docs.docker.com/compose/). Just clone this repo and run following command in the root directory. The default `docker-compose.yml` uses MySQL and phpMyAdmin.

```
$ docker-compose up -d
```

For admin username and password, please refer to the file `env`. You can also update the file `env` to update those configurations. Below are the default configurations.

For get more information about `env` configuration read [PrestaShop command-line script Documentation](http://doc.prestashop.com/display/PS17/Installing+PrestaShop+using+the+command-line+script) 
```
MYSQL_HOST=db
MYSQL_ROOT_PASSWORD=myrootpassword
MYSQL_USER=psbeco
MYSQL_PASSWORD=psbeco
MYSQL_DATABASE=psbecodb
MYSQL_PREFIX=psbeco_
MYSQL_CLEAR=1
MYSQL_CREATE=0
MYSQL_ENGINE=InnoDB

ADMIN_FIRSTNAME=Becopay
ADMIN_LASTNAME=Company 
ADMIN_EMAIL=admin@mail.com
ADMIN_USERNAME=admin
ADMIN_PASSWORD=Admin123456

DOMAIN=127.0.0.1
BASE_URI=/
NAME=PrestaShop
ACTIVITY=0
LANGUAGE=en
TIMEZONE=local
COUNTRY=fr
LICENSE=0
NEWSLETTER=1
SEND_EMAIL=1


```

## Installation

After starting the container, you'll see the setup page of PrestaShop. You can use the script `install-prestashop` to quickly install PrestaShop. The installation script uses the variables in the `env` file.

### PrestaShop

```
$ docker exec -it <container_name> install-prestashop
```

### Database

The default `docker-compose.yml` uses MySQL as the database and starts [phpMyAdmin](https://www.phpmyadmin.net/). The default URL for phpMyAdmin is `http://localhost:8580`. Use MySQL username and password to log in.


## Configure the plugin

__Note :__ You must have a Becopay merchant account to use this plugin.  It's free and easy to [sign-up for a becopay merchant account](https://becopay.com/en/merchant-register/).


  * Click _Installed modules_ tab, locate _Becopay_ module and click _Configure_ button
  * Enter in fields  
	* __Mobile Number__  - enter the phone number you registered in the Becopay here.If you don't have Becopay merchat account register [here](https://becopay.com/en/merchant-register/).
	* __Becopay Api Base Url__  - enter Becopay api base url here. If you don't have Becopay merchat account register [here](https://becopay.com/en/merchant-register/).
	* __Becopay Api Key__  - enter your Becopay Api Key here. If you don't have Becopay merchat account register [here](https://becopay.com/en/merchant-register/).
  * Save Setting
 
__Note:__<br>
The format of your callback link is in this format <br>
`https://your-site/wc-api/BecopayGateway/?orderId=ORDER_ID`

## FAQ

### Where is the database?

PrestaShop cannot run with a database. This image is for PrestaShop only. It doesn't contain MySQL server. MySQL server should be started in another container and linked with PrestaShop container. It's recommended to use Docker Compose to start both containers.

### Why getting access denied error after changing the default DB password?

If you change the default DB password in `env` file and get the access denied error when installing PrestaShop.

## Becopay Support:

* [GitHub Issues](https://github.com/becopay/becopay-prestashop/issues)
  * Open an issue if you are having issues with this plugin
* [Support](https://becopay.com/en/support/#contact-us)
  * Becopay support

## Contribute

Would you like to help with this project?  Great!  You don't have to be a developer, either.  If you've found a bug or have an idea for an improvement, please open an [issue](https://github.com/becopay/becopay-prestashop/issues) and tell us about it.

If you *are* a developer wanting contribute an enhancement, bug fix or other patch to this project, please fork this repository and submit a pull request detailing your changes. We review all PRs!

This open source project is released under the [Apache 2.0 license](https://opensource.org/licenses/Apache-2.0) which means if you would like to use this project's code in your own project you are free to do so.  Speaking of, if you have used our code in a cool new project we would like to hear about it!  [Please send us an email](mailto:io@becopay.com).

## License

Please refer to the [LICENSE](https://opensource.org/licenses/Apache-2.0) file that came with this project.

