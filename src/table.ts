import Airtable from 'airtable'
import { pick } from 'ramda'
import * as config from './config'

const base = new Airtable().base(config.airtable.base);

export async function createRecord(fields: object): Promise<void> {
  const cleanedFields = pick(config.airtable.fields, fields)
  await base(config.airtable.table).create(cleanedFields)
}
