import * as env from 'env-var'

export const airtable = {
  base: env.get('AIRTABLE_BASE').required().asString(),
  table: env.get('AIRTABLE_TABLE').required().asString(),
  fields: env.get('AIRTABLE_FIELDS').required().asArray(),
}
