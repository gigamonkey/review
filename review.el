;;; review.el -- commands for inserting review comments
;;;
;;; Copyright (c) 2012, Peter Seibel
;;; All rights reserved.
;;;
;;; Redistribution and use in source and binary forms, with or without
;;; modification, are permitted provided that the following conditions
;;; are met:
;;;
;;;     * Redistributions of source code must retain the above
;;;       copyright notice, this list of conditions and the following
;;;       disclaimer.
;;;
;;;     * Redistributions in binary form must reproduce the above
;;;       copyright notice, this list of conditions and the following
;;;       disclaimer in the documentation and/or other materials
;;;       provided with the distribution.
;;;
;;;     * Neither the name of Peter Seibel nor the names of its
;;;       contributors may be used to endorse or promote products
;;;       derived from this software without specific prior written
;;;       permission.
;;;
;;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
;;; CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
;;; INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
;;; MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
;;; DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS
;;; BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
;;; EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
;;; TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
;;; DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
;;; ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
;;; TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
;;; THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
;;; SUCH DAMAGE.
;;;

(defvar review-user-name-for-comment nil
  "*User name inserted in comments - defaults to user-mail-address")

(defvar review-comment-start nil
  "A specific comment character to use. Defaults to the value of
  comment-start which should be appropriate for the mode or # if
  neither variable is set.")

(defun review-labeled-timestamp-comment (label)
  "Insert a labled, timestamped, and signed comment."
  (insert (or review-comment-start comment-start "#")
          (if (string-match " $" comment-start) "" " ")
          label " " (format-time-string "%Y-%m-%d")
          " <" (review-user-email) "> -- ")
  (indent-according-to-mode))

(defun review-user-email ()
  (or review-user-name-for-comment user-mail-address))

(defun review-fixme-comment ()
  "Insert a timestamped, signed FIXME comment."
  (interactive)
  (review-labeled-timestamp-comment "FIXME"))

(defun review-review-comment ()
  "Insert a timestamped, signed REVIEW comment."
  (interactive)
  (review-labeled-timestamp-comment "REVIEW"))

(defun review-optimize-comment ()
  "Insert a timestamped, signed OPTIMIZE comment."
  (interactive)
  (review-labeled-timestamp-comment "OPTIMIZE"))
