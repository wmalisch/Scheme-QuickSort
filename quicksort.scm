(define quicksort
  (lambda (L)
    (letrec ((partition
        (lambda (e L L1 L2)
          (if (null? L) (cons L1 L2)
            (let ((c (car L)))
              (if (< c e)
                (partition e (cdr L) (cons c L1) L2)
                (partition e (cdr L) L1 (cons c L2))))))))
      (cond
        ((null? L) L)
        ((null? (cdr L)) L)
        (else (let* ((L12 (partition (car L) (cdr L) '() '()))
              (L1 (car L12))
              (L2 (cdr L12)))
            (append (quicksort L1)
                (list (car L))
                (quicksort L2))))))))
