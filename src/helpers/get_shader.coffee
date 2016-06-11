module.exports = get_shader = (gl, source, type, typeString) ->
    shader = gl.createShader type
    gl.shaderSource shader, source
    gl.compileShader shader
    if not gl.getShaderParameter(shader, gl.COMPILE_STATUS)
        c "error in" + typeString + " SHADER: " + gl.getShaderInfoLog(shader)
        return false
    return shader
