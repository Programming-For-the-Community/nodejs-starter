const homePageService = (req, res) => {
  console.log('api/home hit');
  res.sendFile(path.join(__dirname, 'dist', 'index.html'));
};

module.exports = homePageService;