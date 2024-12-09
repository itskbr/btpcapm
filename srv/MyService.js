module.exports = (srv) =>{
    srv.on('danfoss', req => `Hello ${req.data.name}`);  //tilt sign
}