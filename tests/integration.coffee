process.env.NODE_ENV ?= 'test'
expect = require 'expect.js'
request = require 'supertest'

DatabaseCleaner = require 'database-cleaner'
databaseCleaner = new DatabaseCleaner 'mongodb'
