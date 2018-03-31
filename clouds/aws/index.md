Welcome to the CPI release for Amazon Web Services (AWS). Summarized in [their own words](https://aws.amazon.com/what-is-aws/)...

>
Amazon Web Services (AWS) is a secure cloud services platform, offering compute power, database storage, content delivery and other functionality to help businesses scale and grow.


## Release

If you are interested in using this release...

@todo


## Development

Development for this release occurs on GitHub in [cloudfoundry-incubator/bosh-aws-cpi-release](https://github.com/cloudfoundry-incubator/bosh-aws-cpi-release).


## Help and Support

If you are having issues, please create a [GitHub issue](https://github.com/cloudfoundry-incubator/bosh-aws-cpi-release/issues) or ask for help in the [`#bosh`](https://cloudfoundry.slack.com/messages/C02HPPYQ2/) channel of [Cloud Foundry slack](../../todo.md).


## Terminology

If you are more familiar with AWS, the following table maps AWS resources to BOSH terminology:

| BOSH             | Amazon Web Services                                                                       |
| ---------------- | ----------------------------------------------------------------------------------------- |
| Disk             | [EC2 EBS Volume](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSVolumes.html)     |
| Disk Snapshot    | [EC2 EBS Snapshot](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSSnapshots.html) |
| Stemcell         | [EC2 AMI](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html)                  |
| Virtual Machine  | [EC2 Instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Instances.html)        |


## Feature Support

The following describes the scope of support for some specialized features within BOSH:

| Feature           | Support                                                                                      |
| ----------------- | -------------------------------------------------------------------------------------------- |
| Manual Networks   | Single IP per instance                                                                       |
| Dynamic Networks  | Single IP per instance                                                                       |
| VIP Networks      | Single IP per instance                                                                       |
| Computed VM Sizes | Since [v56](https://github.com/cloudfoundry-incubator/bosh-aws-cpi-release/releases/tag/v56) |
