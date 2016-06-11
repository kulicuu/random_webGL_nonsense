
precision mediump float;

// varying vec4 v_color;

precision mediump float;
uniform vec4 u_color;

void main() {
    // gl_FragColor = vec4(0, 1, 2, 1);
    gl_FragColor = u_color;
}
