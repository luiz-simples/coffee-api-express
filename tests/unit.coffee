process.env.NODE_ENV ?= 'test'
expect = require 'expect.js'

DatabaseCleaner = require 'database-cleaner'
databaseCleaner = new DatabaseCleaner 'mongodb'
