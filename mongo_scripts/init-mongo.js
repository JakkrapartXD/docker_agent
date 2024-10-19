db = db.getSiblingDB('wallboarddb');

db.createCollection("log", { capped: true, size: 5242880, max: 5000 });

db.createUser({
  user: 'wallboarduser',
  pwd: 'WB1qazxsw2',
  roles: [{ role: 'readWrite', db: 'wallboarddb' }]
});

db.log.insertOne({ capped: true, size: 5242880, max: 5000 });