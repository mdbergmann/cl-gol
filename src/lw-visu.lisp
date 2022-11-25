(defpackage :gui
  (:use :cl :capi))
(in-package :gui)

(defparameter *pane-size* 500)

(defvar *blinker* #(#(0 0 0 0 0 0 0 0 0 0)
                    #(0 0 0 0 0 0 0 0 0 0)
                    #(0 0 1 1 1 0 0 0 0 0)
                    #(0 0 0 0 0 0 0 0 0 0)
                    #(0 0 0 0 0 0 0 0 0 0)
                    #(0 0 0 0 0 0 0 0 0 0)
                    #(0 0 0 0 0 0 0 0 0 0)
                    #(0 0 0 0 0 0 0 0 0 0)
                    #(0 0 0 0 0 0 0 0 0 0)
                    #(0 0 0 0 0 0 0 0 0 0)))

(defvar *toad* #(#(0 0 0 0 0 0 0 0 0 0)
                 #(0 0 0 0 0 0 0 0 0 0)
                 #(0 0 1 1 1 0 0 0 0 0)
                 #(0 1 1 1 0 0 0 0 0 0)
                 #(0 0 0 0 0 0 0 0 0 0)
                 #(0 0 0 0 0 0 0 0 0 0)
                 #(0 0 0 0 0 0 0 0 0 0)
                 #(0 0 0 0 0 0 0 0 0 0)
                 #(0 0 0 0 0 0 0 0 0 0)
                 #(0 0 0 0 0 0 0 0 0 0)))

(defvar *glider* #(#(0 0 0 1 0 0 0 0 0 0)
                   #(0 0 0 0 1 0 0 0 0 0)
                   #(0 0 1 1 1 0 0 0 0 0)
                   #(0 0 0 0 0 0 0 0 0 0)
                   #(0 0 0 0 0 0 0 0 0 0)
                   #(0 0 0 0 0 0 0 0 0 0)
                   #(0 0 0 0 0 0 0 0 0 0)
                   #(0 0 0 0 0 0 0 0 0 0)
                   #(0 0 0 0 0 0 0 0 0 0)
                   #(0 0 0 0 0 0 0 0 0 0)))

(defparameter *grid* #(#(0 0 1)
                       #(1 0 1)
                       #(1 1 0)))

(defvar *update-thread* nil)
(defvar *pane* nil)

(defun my-display (self
                   x y
                   width height)
  (declare (ignore x y height))
  (loop :for row-index :upto (1- (length *grid*))
        :for row = (aref *grid* row-index)
        :for cell-width = (/ width (length *grid*))
        :for cell-height = cell-width
        :do
           (loop :for col-index :upto (1- (length row))
                 :for cell = (aref row col-index)
                 :for x = (* col-index cell-width)
                 :for y = (* row-index cell-width)
                 :for color = (if (= cell 0) :white :black)
                 :do
                    (gp:draw-rectangle self x y (1- cell-width) (1- cell-height) :filled t :foreground color))))

(defun show ()
  (update
   (setf *pane*
         (contain
          (make-instance
           'output-pane
           :display-callback (lambda (&rest args) (apply #'my-display args)))
          :best-width *pane-size*
          :best-height *pane-size*))))

(defun stop ()
  (bt:destroy-thread *update-thread*))

(defun update (pane)
  (setf *update-thread*
        (bt:make-thread (lambda ()
                          (loop
                            (redisplay-element pane)
                            (sleep 1.0)
                            (setf *grid* (game:next-gen *grid*)))))))
