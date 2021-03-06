module.exports = {
    publicPath: '/',
    devServer: {
        proxy: {
            '/api': {
                target: `${process.env.VUE_APP_API_URL}`
            }
        },
        host: '0.0.0.0',
        disableHostCheck: true,
        port: 80,
        public: '52.78.203.0:80',
    }
}