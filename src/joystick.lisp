(in-package #:sdl2)

(defmacro joystick-update ()
  "Use this function to update the current state of the open joysticks.
This function is called automatically by the event loop if joystick events are enabled."
  `(sdl-joystick-update))

(defun joystick-count ()
  (check-rc (sdl-num-joysticks)))

(defun joystick-open (device-index)
  (sdl-joystick-open device-index))

(defun joystick-close (joystick)
  (sdl-joystick-close joystick))

(defun joystick-name-for-index (device-index)
  (check-nil (sdl-joystick-name-for-index device-index)))

(defun joystick-name (joystick)
  (check-nil (sdl-joystick-name joystick)))

(defmacro joystick-caps-query (fn joystick)
  `(check-rc (,fn ,joystick)))

(defun joystick-hat-count (joystick)
  (joystick-caps-query sdl-joystick-num-hats joystick))

(defun joystick-axis-count (joystick)
  (joystick-caps-query sdl-joystick-num-axes joystick))

(defun joystick-ball-count (joystick)
  (joystick-caps-query sdl-joystick-num-balls joystick))

(defun joystick-button-count (joystick)
  (joystick-caps-query sdl-joystick-num-buttons joystick))

(defun joystick-instance-id (joystick)
  (sdl-joystick-instance-id joystick))

(defun joystick-get-axis (joystick axis)
  (sdl-joystick-get-axis joystick axis))

(defun joystick-get-hat (joystick hat)
  "Return the current state of a hat"
  (sdl-joystick-get-hat joystick hat))

(defun joystick-rumble (joystick low-frequency-rumble high-frequency-rumble duration-ms)
  "Start a rumble effect for a duration of DURATION-MS. The low and high
frequences are between 0 and 0xFFFF."
  (sdl-joystick-rumble joystick low-frequency-rumble high-frequency-rumble duration-ms))

(defun joystick-has-rumble (joystick)
  "Return T when the JOYSTICK has rumble effects."
  (sdl-true-p (sdl-joystick-has-rumble joystick)))
