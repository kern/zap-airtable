# zap-airtable

Use Google Cloud Functions to create records in Airtable.

## Usage

Create a file `config.yaml` with the following information:

```yaml
AIRTABLE_API_KEY: keyXXXXXXXXXXXXXX    # Airtable API key
AIRTABLE_BASE: appXXXXXXXXXXXXXX       # Airtable base identifier
AIRTABLE_TABLE: My Table               # name of the Airtable table
AIRTABLE_FIELDS: First Name,Last Name  # whitelisted fields to be added
```

Then deploy the function to Google Cloud:

    $ gcloud functions deploy MY_CLOUD_FN_NAME \
        --runtime nodejs10 \
        --trigger-http \
        --entry-point perform \
        --source gs://zap-airtable/function.zip \
        --env-vars-file config.yaml

You can now make POST requests to the function's trigger URL. Fields passed in the request body will be added to a new record in the designated Airtable base/table.

## Development

    $ make lint
    $ make build

## License

BSD 3-Clause
