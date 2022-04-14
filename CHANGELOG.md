# Changelog

All notable changes to this project will be documented in this file.

## [3.2.0](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/compare/v3.1.0...v3.2.0) (2022-04-14)


### Features

* Allow overriding items for each control in `cis-alarms` module ([#41](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/issues/41)) ([f04d5d1](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/commit/f04d5d1019a724e4a415768113858e7ad9d8422e))

## [3.1.0](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/compare/v3.0.0...v3.1.0) (2022-04-12)


### Features

* Added wrappers for all modules ([#40](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/issues/40)) ([943debc](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/commit/943debcf60f07bd3ead912aaafe19ddca9451405))

## [3.0.0](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/compare/v2.5.0...v3.0.0) (2022-04-07)


### ⚠ BREAKING CHANGES

* Added log-stream module, updated versions to 0.13+ (#38)

### Features

* Added log-stream module, updated versions to 0.13+ ([#38](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/issues/38)) ([b426858](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/commit/b42685899793c3ae1733844f07c610e9aa663250))

## [2.5.0](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/compare/v2.4.1...v2.5.0) (2022-03-18)


### Features

* Added anomaly detection support ([#36](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/issues/36)) ([7fd2eea](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/commit/7fd2eea01d33aeef171424e0530f3a893fddfb38))

### [2.4.1](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/compare/v2.4.0...v2.4.1) (2022-01-21)


### Bug Fixes

* Update required version for aws provider ([#34](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/issues/34)) ([b7e0147](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/commit/b7e0147c9afe38194f6a4fa041eed7615fbd38dd))

## [2.4.0](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/compare/v2.3.1...v2.4.0) (2022-01-19)


### Features

* Added account_id to metric_query section ([#33](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/issues/33)) ([fb4dcd8](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/commit/fb4dcd802d895c8215fe1fe25e0df0f7b4d479a7))

### [2.3.1](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/compare/v2.3.0...v2.3.1) (2022-01-13)


### Bug Fixes

* Added prefix to metric name for alarm to work ([#32](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/issues/32)) ([f1c750f](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/commit/f1c750fb79a82c1b3fbc76ec2e0df6c768e6fa9a))

# [2.3.0](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/compare/v2.2.0...v2.3.0) (2021-12-15)


### Features

* Added support for custom CIS alarm names ([#29](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/issues/29)) ([9d5d1c4](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/commit/9d5d1c42345ec5f9b01a129a18852a62a93a0267))

# [2.2.0](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/compare/v2.1.0...v2.2.0) (2021-12-14)


### Bug Fixes

* update CI/CD process to enable auto-release workflow ([#27](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/issues/27)) ([12b9abb](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/commit/12b9abbfd678ca97e856a33a102d76d71c1a7e43))


### Features

* Update CIS-Alarms for v1.4.0 of the AWS Benchmark ([#26](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/issues/26)) ([fd33034](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/commit/fd3303464a3ad31a91e21bdf09ab572f387650f8))

<a name="v2.1.0"></a>
## [v2.1.0] - 2021-05-03

- feat: Added module for Cloudwatch log group ([#23](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/issues/23))
- chore: update CI/CD to use stable `terraform-docs` release artifact and discoverable Apache2.0 license ([#22](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/issues/22))


<a name="v2.0.0"></a>
## [v2.0.0] - 2021-04-27

- feat: Shorten outputs (removing this_) ([#21](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/issues/21))


<a name="v1.4.0"></a>
## [v1.4.0] - 2021-04-07

- fix: change UnauthorizedAPICalls description according to AWS CIS guide ([#20](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/issues/20))
- chore: update documentation and pin `terraform_docs` version to avoid future changes ([#19](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/issues/19))
- chore: add ci-cd workflow for pre-commit checks ([#17](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/issues/17))


<a name="v1.3.0"></a>
## [v1.3.0] - 2020-11-24

- fix: Updated supported Terraform versions ([#15](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/issues/15))


<a name="v1.2.0"></a>
## [v1.2.0] - 2020-05-20

- feat: Added default value of 0 for metric filter for cis-alarms ([#12](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/issues/12))


<a name="v1.1.0"></a>
## [v1.1.0] - 2020-05-11

- docs: Updated README
- fix: Changing metric_transformation_value var type to string ([#11](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/issues/11))


<a name="v1.0.0"></a>
## [v1.0.0] - 2020-03-25

- feat: Added cis-alarms as CIS AWS Foundations Controls ([#10](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/issues/10))
- Merge pull request [#9](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/issues/9) from terraform-aws-modules/terraform-provider-githubfile-1584635096252900000
- [ci skip] Create ".chglog/CHANGELOG.tpl.md".
- Merge pull request [#5](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/issues/5) from terraform-aws-modules/terraform-provider-githubfile-1584535788164202000
- Merge pull request [#6](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/issues/6) from terraform-aws-modules/terraform-provider-githubfile-1584535788163868000
- Merge pull request [#7](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/issues/7) from terraform-aws-modules/terraform-provider-githubfile-1584535788164201000
- Merge pull request [#8](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/issues/8) from terraform-aws-modules/terraform-provider-githubfile-1584535788163754000
- Merge pull request [#4](https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/issues/4) from terraform-aws-modules/terraform-provider-githubfile-1584535788163769000
- [ci skip] Create "LICENSE".
- [ci skip] Create ".pre-commit-config.yaml".
- [ci skip] Create ".editorconfig".
- [ci skip] Create ".gitignore".
- [ci skip] Create "Makefile".


<a name="v0.2.0"></a>
## [v0.2.0] - 2019-08-29

- Added metric-alarms-by-multiple-dimensions submodule
- Updated pre-commit hooks
- Updated version of pre-commit-terraform
- Updated README


<a name="v0.1.0"></a>
## v0.1.0 - 2019-06-17

- Added log-metric-filter and metric-alarm module


[Unreleased]: https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/compare/v2.1.0...HEAD
[v2.1.0]: https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/compare/v2.0.0...v2.1.0
[v2.0.0]: https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/compare/v1.4.0...v2.0.0
[v1.4.0]: https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/compare/v1.3.0...v1.4.0
[v1.3.0]: https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/compare/v1.2.0...v1.3.0
[v1.2.0]: https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/compare/v1.1.0...v1.2.0
[v1.1.0]: https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/compare/v1.0.0...v1.1.0
[v1.0.0]: https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/compare/v0.2.0...v1.0.0
[v0.2.0]: https://github.com/terraform-aws-modules/terraform-aws-cloudwatch/compare/v0.1.0...v0.2.0
