When using an Amazon S3 bucket for a publicly shared release, you will typically want to secure the bucket using both Bucket and IAM Policies. After you have created your S3 bucket, you may want to use these base policies for securing access to your blobstore.


## Public Read-only Access

Within the [AWS S3 Console](https://s3.console.aws.amazon.com/s3/home), navigate to your bucket, its **Permissions** tab, and the **Bucket Policy** button to update the policy. Use the following JSON policy, replacing `((bucket_name))` with your own bucket name.

```json
{
  "Statement": [
    {
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Principal": "*",
      "Resource": "arn:aws:s3:::((bucket_name))/*"
    }
  ]
}
```

!!! help "Learn More"
    To learn more about S3 bucket policies, visit the [Adding an S3 Bucket Policy](https://docs.aws.amazon.com/AmazonS3/latest/user-guide/add-bucket-policy.html) from the AWS documentation.


## Author Write Access

Within the [AWS IAM Console](https://console.aws.amazon.com/iam/home):

1. Create a new User.
    * For convenience, you may want to reuse the bucket name as the user name.
    * Be sure to enable Programmatic Access.
    * You can skip steps around granting permissions via groups or existing policies.

1. After creating the new user, be sure to update your `config/private.yml` file with the credentials it provides on the confirmation page. The file should look like the following, replace `((access_key))` and `((secret_key))`:

    ```yaml
    blobstore:
      options:
        access_key_id: ((access_key))
        secret_access_key: ((secret_key))
    ```

1. Once created, you may choose to Add Inline Policy. Use the following JSON policy, replacing `((bucket_name))` with your own bucket name.

    ```json
    {
      "Statement": [
        {
          "Action": [
            "s3:PutObject"
          ],
          "Effect": "Allow",
          "Resource": "arn:aws:s3:::((bucket_name))/*"
        }
      ],
      "Version": "2012-10-17"
    }
    ```

!!! info
    This policy only adds write permissions because the BOSH CLI never tries to delete blobs from the blobstore.

!!! help "Learn More"
    To learn more about IAM policies, visit the [Creating IAM Policies](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_create.html) or [Understanding Policy Permissions](https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_understand.html) from the AWS documentation.
