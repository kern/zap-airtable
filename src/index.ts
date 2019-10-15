import { Request, Response } from 'express'
import { createRecord } from './table'

export async function perform(req: Request, res: Response): Promise<void> {
  switch (req.method) {
    case 'POST':
      try {
        await createRecord(req.body)
        res
          .status(200)
          .type("application/json")
          .send({ ok: true })
          .end()
      } catch (err) {
        res
          .status(400)
          .type("application/json")
          .send({ error: err.toString() })
          .end()
      }
      break
    default:
      res
        .status(405)
        .type("application/json")
        .send({ error: 'only POST requests supported' })
        .end()
      break
  }
}
