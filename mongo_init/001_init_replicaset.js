rs.initiate({
  _id : "mongo-set",
  members: [
    {
      _id: 0,
      host: `mongo:27017`,
    },
    {
      _id: 1,
      host: "mongo-secondary:27017",
    },
    {
      _id: 2,
      host: "mongo-arbiter:27017",
      arbiterOnly: true,
    },
  ],
});