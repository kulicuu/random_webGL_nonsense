require './globals.coffee'
document.getElementsByTagName('body')[0].style.overflow = 'hidden'

vertex_shader_source = require('./shaders/vertex_shader_001_.glsl')
fragment_shader_source = require('./shaders/fragment_shader_000_.glsl')

canvas = document.getElementById('canvas_000')
# canvas.width = canvas.clientWidth
# canvas.height = canvas.clientHeight
gl = canvas.getContext 'experimental-webgl'#, preserveDrawingBuffer: true

fragment_shader = get_shader(gl, fragment_shader_source, gl.FRAGMENT_SHADER, 'FRAGMENT')
vertex_shader = get_shader(gl, vertex_shader_source, gl.VERTEX_SHADER, 'VERTEX')
# gl.viewport(0, 0, window.innerWidth, window.innerHeight)

# program = createProgramFromScripts gl, [vertex_shader, fragment_shader]

program = gl.createProgram()
gl.attachShader program, vertex_shader
gl.attachShader program, fragment_shader
gl.linkProgram program
gl.useProgram program


colorLocation = gl.getUniformLocation program, "u_color"
resolutionLocation = gl.getUniformLocation(program, "u_resolution")
gl.uniform2f(resolutionLocation, canvas.width, canvas.height)
positionLocation = gl.getAttribLocation program, "a_position"

buffer = gl.createBuffer()
gl.bindBuffer gl.ARRAY_BUFFER, buffer

gl.enableVertexAttribArray positionLocation
gl.vertexAttribPointer positionLocation, 2, gl.FLOAT, false, 0, 0


# resolutionLocation = gl.getUniformLocation(program, "u_resolution")
# gl.uniform2f(resolutionLocation, canvas.width, canvas.height)
# positionLocation = gl.getAttribLocation program, "a_position"
#
# buffer = gl.createBuffer()
#
# gl.bindBuffer gl.ARRAY_BUFFER, buffer

rayy = new Float32Array [
    -1.0, -1.0,
    1.0, -1.0,
    -1.0, 1.0,
    -1.0, 1.0,
    1, -1.0,
    1.0, 1.0
    ]
rayy4 = new Float32Array [
    10, 20,
    80, 20,
    10, 50,


    10, 50,
    80, 20,
    80, 50
]

rayy5 = new Float32Array [
    50, 60,
    480, 60,
    50, 1580,


    10, 30,
    40, 20,
    40, 50

]


# gl.enableVertexAttribArray positionLocation
# gl.vertexAttribPointer positionLocation, 2, gl.FLOAT, false, 0, 0
#
# gl.bufferData gl.ARRAY_BUFFER, rayy4s, gl.STATIC_DRAW
#
#
# gl.drawArrays gl.TRIANGLES, 0, 6





gl.bufferData gl.ARRAY_BUFFER, rayy4, gl.STATIC_DRAW
gl.drawArrays gl.TRIANGLES, 0, 6

# rayy2 = new Float32Array [
#     -1.0, -1.0,
#     1.0, -1.0,
#     -2.0, 1.0,
#     -1.0, 1.0,
#     1, -1.0,
#     1.0, 1.0
# ]

set_rectangle = (gl, x, y, width, height) ->
    x1 = x
    x2 = x + width
    y1 = y
    y2 = y + height
    rayy = new Float32Array [
        x1, y1,
        x2, y1,
        x1, y2,
        x1, y2,
        x2, y1,
        x2, y2
    ]
    gl.bufferData gl.ARRAY_BUFFER, rayy, gl.STATIC_DRAW


random_int = (range) ->
    return Math.floor(Math.random() * range)


outer = ->
    gl.drawArrays gl.TRIANGLES, 0, 6


@gl = gl

for i in [0 .. 20]
    set_rectangle @gl, random_int(200), random_int(200), random_int(50), random_int(50)

    @gl.uniform4f colorLocation, Math.random(), Math.random(), Math.random(), 1
    # outer()
    @gl.drawArrays gl.TRIANGLES, 0, 6

counter = 0


set_rectangle gl, random_int(200), random_int(200), random_int(500), random_int(50)

gl.uniform4f colorLocation, Math.random(), Math.random(), Math.random(), 1
# outer()
gl.drawArrays gl.TRIANGLES, 0, 6
set_rectangle gl, random_int(200), random_int(200), random_int(50), random_int(500)

# @gl.uniform4f colorLocation, Math.random(), Math.random(), Math.random(), 1
# # outer()
# @gl.drawArrays gl.TRIANGLES, 0, 6


interval = setInterval ->
    counter++
    if counter < 300
        set_rectangle gl, random_int(200), random_int(200), random_int(50), random_int(50)
        gl.uniform4f colorLocation, Math.random(), Math.random(), Math.random(), 1
        gl.drawArrays gl.TRIANGLES, 0, 6
        set_rectangle gl, random_int(200), random_int(200), random_int(150), random_int(150)
        gl.uniform4f colorLocation, Math.random(), Math.random(), Math.random(), 1
        gl.drawArrays gl.TRIANGLES, 0, 6
    else
        clearInterval interval
, 30



# setTimeout =>
#     gl.bufferData gl.ARRAY_BUFFER, rayy5, gl.STATIC_DRAW
#     # gl.enableVertexAttribArray positionLocation
#     # gl.vertexAttribPointer positionLocation, 2, gl.FLOAT, false, 0, 0
#
#     gl.drawArrays gl.TRIANGLES, 0, 6
#
# , 1000


# func_002 = (rayy) =>
#     # gl.enableVertexAttribArray positionLocation
#     # gl.vertexAttribPointer positionLocation, 2, gl.FLOAT, false, 0,
#     gl.bufferData gl.ARRAY_BUFFER, rayy, gl.STATIC_DRAW
#     gl.drawArrays gl.TRIANGLES, 0, 3
#
# rayy3 = [
#     -01, -0.001,
#     -.001, -.005,
#     -.2, -.23
# ]
#
# setTimeout =>
#     func_002 rayy3
# , 1000
