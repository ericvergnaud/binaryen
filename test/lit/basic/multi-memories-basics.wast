;; NOTE: Assertions have been generated by update_lit_checks.py --all-items and should not be edited.

;; RUN: wasm-opt %s -all -o %t.text.wast -g -S
;; RUN: wasm-as %s -all -g -o %t.wasm
;; RUN: wasm-dis %t.wasm -all -o %t.bin.wast
;; RUN: wasm-as %s -all -o %t.nodebug.wasm
;; RUN: wasm-dis %t.nodebug.wasm -all -o %t.bin.nodebug.wast
;; RUN: cat %t.text.wast | filecheck %s --check-prefix=CHECK-TEXT
;; RUN: cat %t.bin.wast | filecheck %s --check-prefix=CHECK-BIN
;; RUN: cat %t.bin.nodebug.wast | filecheck %s --check-prefix=CHECK-BIN-NODEBUG

(module
 ;; CHECK-TEXT:      (type $none_=>_none (func))
 ;; CHECK-BIN:      (type $none_=>_none (func))
 (type $none_=>_none (func))
 ;; CHECK-TEXT:      (type $none_=>_i32 (func (result i32)))
 ;; CHECK-BIN:      (type $none_=>_i32 (func (result i32)))
 (type $none_=>_i32 (func (result i32)))
 ;; CHECK-TEXT:      (import "env" "memory" (memory $importedMemory 1 1))
 ;; CHECK-BIN:      (import "env" "memory" (memory $importedMemory 1 1))
 (import "env" "memory" (memory $importedMemory 1 1))
 ;; CHECK-TEXT:      (memory $memory1 1 500)
 ;; CHECK-BIN:      (memory $memory1 1 500)
 (memory $memory1 1 500)
 ;; CHECK-TEXT:      (memory $memory2 1 800)
 ;; CHECK-BIN:      (memory $memory2 1 800)
 (memory $memory2 1 800)
 ;; CHECK-TEXT:      (memory $memory3 1 400)
 ;; CHECK-BIN:      (memory $memory3 1 400)
 (memory $memory3 1 400)
 (data (i32.const 0) "abcd")

 ;; CHECK-TEXT:      (data $0 (i32.const 0) "abcd")

 ;; CHECK-TEXT:      (func $memory.fill (type $none_=>_none)
 ;; CHECK-TEXT-NEXT:  (memory.fill $memory2
 ;; CHECK-TEXT-NEXT:   (i32.const 0)
 ;; CHECK-TEXT-NEXT:   (i32.const 1)
 ;; CHECK-TEXT-NEXT:   (i32.const 2)
 ;; CHECK-TEXT-NEXT:  )
 ;; CHECK-TEXT-NEXT: )
 ;; CHECK-BIN:      (data $0 (i32.const 0) "abcd")

 ;; CHECK-BIN:      (func $memory.fill (type $none_=>_none)
 ;; CHECK-BIN-NEXT:  (memory.fill $memory2
 ;; CHECK-BIN-NEXT:   (i32.const 0)
 ;; CHECK-BIN-NEXT:   (i32.const 1)
 ;; CHECK-BIN-NEXT:   (i32.const 2)
 ;; CHECK-BIN-NEXT:  )
 ;; CHECK-BIN-NEXT: )
 (func $memory.fill
  (memory.fill $memory2
   (i32.const 0)
   (i32.const 1)
   (i32.const 2)
  )
 )

 ;; CHECK-TEXT:      (func $memory.copy (type $none_=>_none)
 ;; CHECK-TEXT-NEXT:  (memory.copy $memory2 $memory3
 ;; CHECK-TEXT-NEXT:   (i32.const 512)
 ;; CHECK-TEXT-NEXT:   (i32.const 0)
 ;; CHECK-TEXT-NEXT:   (i32.const 12)
 ;; CHECK-TEXT-NEXT:  )
 ;; CHECK-TEXT-NEXT: )
 ;; CHECK-BIN:      (func $memory.copy (type $none_=>_none)
 ;; CHECK-BIN-NEXT:  (memory.copy $memory2 $memory3
 ;; CHECK-BIN-NEXT:   (i32.const 512)
 ;; CHECK-BIN-NEXT:   (i32.const 0)
 ;; CHECK-BIN-NEXT:   (i32.const 12)
 ;; CHECK-BIN-NEXT:  )
 ;; CHECK-BIN-NEXT: )
 (func $memory.copy
  (memory.copy $memory2 $memory3
   (i32.const 512)
   (i32.const 0)
   (i32.const 12)
  )
 )

 ;; CHECK-TEXT:      (func $memory.init (type $none_=>_none)
 ;; CHECK-TEXT-NEXT:  (memory.init $memory1 $0
 ;; CHECK-TEXT-NEXT:   (i32.const 0)
 ;; CHECK-TEXT-NEXT:   (i32.const 0)
 ;; CHECK-TEXT-NEXT:   (i32.const 45)
 ;; CHECK-TEXT-NEXT:  )
 ;; CHECK-TEXT-NEXT: )
 ;; CHECK-BIN:      (func $memory.init (type $none_=>_none)
 ;; CHECK-BIN-NEXT:  (memory.init $memory1 $0
 ;; CHECK-BIN-NEXT:   (i32.const 0)
 ;; CHECK-BIN-NEXT:   (i32.const 0)
 ;; CHECK-BIN-NEXT:   (i32.const 45)
 ;; CHECK-BIN-NEXT:  )
 ;; CHECK-BIN-NEXT: )
 (func $memory.init
  (memory.init $memory1 0
   (i32.const 0)
   (i32.const 0)
   (i32.const 45)
  )
 )

 ;; CHECK-TEXT:      (func $memory.grow (type $none_=>_i32) (result i32)
 ;; CHECK-TEXT-NEXT:  (memory.grow $memory3
 ;; CHECK-TEXT-NEXT:   (i32.const 10)
 ;; CHECK-TEXT-NEXT:  )
 ;; CHECK-TEXT-NEXT: )
 ;; CHECK-BIN:      (func $memory.grow (type $none_=>_i32) (result i32)
 ;; CHECK-BIN-NEXT:  (memory.grow $memory3
 ;; CHECK-BIN-NEXT:   (i32.const 10)
 ;; CHECK-BIN-NEXT:  )
 ;; CHECK-BIN-NEXT: )
 (func $memory.grow (result i32)
  (memory.grow $memory3
   (i32.const 10)
  )
 )

 ;; CHECK-TEXT:      (func $memory.size (type $none_=>_i32) (result i32)
 ;; CHECK-TEXT-NEXT:  (memory.size $memory3)
 ;; CHECK-TEXT-NEXT: )
 ;; CHECK-BIN:      (func $memory.size (type $none_=>_i32) (result i32)
 ;; CHECK-BIN-NEXT:  (memory.size $memory3)
 ;; CHECK-BIN-NEXT: )
 (func $memory.size (result i32)
  (memory.size $memory3)
 )

 ;; CHECK-TEXT:      (func $loads (type $none_=>_none)
 ;; CHECK-TEXT-NEXT:  (drop
 ;; CHECK-TEXT-NEXT:   (i32.load $memory1
 ;; CHECK-TEXT-NEXT:    (i32.const 12)
 ;; CHECK-TEXT-NEXT:   )
 ;; CHECK-TEXT-NEXT:  )
 ;; CHECK-TEXT-NEXT:  (drop
 ;; CHECK-TEXT-NEXT:   (i32.load $memory3
 ;; CHECK-TEXT-NEXT:    (i32.const 12)
 ;; CHECK-TEXT-NEXT:   )
 ;; CHECK-TEXT-NEXT:  )
 ;; CHECK-TEXT-NEXT:  (drop
 ;; CHECK-TEXT-NEXT:   (i32.load16_s $memory2
 ;; CHECK-TEXT-NEXT:    (i32.const 12)
 ;; CHECK-TEXT-NEXT:   )
 ;; CHECK-TEXT-NEXT:  )
 ;; CHECK-TEXT-NEXT:  (drop
 ;; CHECK-TEXT-NEXT:   (i32.load16_s $memory2
 ;; CHECK-TEXT-NEXT:    (i32.const 12)
 ;; CHECK-TEXT-NEXT:   )
 ;; CHECK-TEXT-NEXT:  )
 ;; CHECK-TEXT-NEXT:  (drop
 ;; CHECK-TEXT-NEXT:   (i32.load8_s $memory3
 ;; CHECK-TEXT-NEXT:    (i32.const 12)
 ;; CHECK-TEXT-NEXT:   )
 ;; CHECK-TEXT-NEXT:  )
 ;; CHECK-TEXT-NEXT:  (drop
 ;; CHECK-TEXT-NEXT:   (i32.load8_s $memory3
 ;; CHECK-TEXT-NEXT:    (i32.const 12)
 ;; CHECK-TEXT-NEXT:   )
 ;; CHECK-TEXT-NEXT:  )
 ;; CHECK-TEXT-NEXT:  (drop
 ;; CHECK-TEXT-NEXT:   (i32.load16_u $memory1
 ;; CHECK-TEXT-NEXT:    (i32.const 12)
 ;; CHECK-TEXT-NEXT:   )
 ;; CHECK-TEXT-NEXT:  )
 ;; CHECK-TEXT-NEXT:  (drop
 ;; CHECK-TEXT-NEXT:   (i32.load16_u $memory1
 ;; CHECK-TEXT-NEXT:    (i32.const 12)
 ;; CHECK-TEXT-NEXT:   )
 ;; CHECK-TEXT-NEXT:  )
 ;; CHECK-TEXT-NEXT:  (drop
 ;; CHECK-TEXT-NEXT:   (i32.load8_u $memory2
 ;; CHECK-TEXT-NEXT:    (i32.const 12)
 ;; CHECK-TEXT-NEXT:   )
 ;; CHECK-TEXT-NEXT:  )
 ;; CHECK-TEXT-NEXT:  (drop
 ;; CHECK-TEXT-NEXT:   (i32.load8_u $memory2
 ;; CHECK-TEXT-NEXT:    (i32.const 12)
 ;; CHECK-TEXT-NEXT:   )
 ;; CHECK-TEXT-NEXT:  )
 ;; CHECK-TEXT-NEXT: )
 ;; CHECK-BIN:      (func $loads (type $none_=>_none)
 ;; CHECK-BIN-NEXT:  (drop
 ;; CHECK-BIN-NEXT:   (i32.load $memory1
 ;; CHECK-BIN-NEXT:    (i32.const 12)
 ;; CHECK-BIN-NEXT:   )
 ;; CHECK-BIN-NEXT:  )
 ;; CHECK-BIN-NEXT:  (drop
 ;; CHECK-BIN-NEXT:   (i32.load $memory3
 ;; CHECK-BIN-NEXT:    (i32.const 12)
 ;; CHECK-BIN-NEXT:   )
 ;; CHECK-BIN-NEXT:  )
 ;; CHECK-BIN-NEXT:  (drop
 ;; CHECK-BIN-NEXT:   (i32.load16_s $memory2
 ;; CHECK-BIN-NEXT:    (i32.const 12)
 ;; CHECK-BIN-NEXT:   )
 ;; CHECK-BIN-NEXT:  )
 ;; CHECK-BIN-NEXT:  (drop
 ;; CHECK-BIN-NEXT:   (i32.load16_s $memory2
 ;; CHECK-BIN-NEXT:    (i32.const 12)
 ;; CHECK-BIN-NEXT:   )
 ;; CHECK-BIN-NEXT:  )
 ;; CHECK-BIN-NEXT:  (drop
 ;; CHECK-BIN-NEXT:   (i32.load8_s $memory3
 ;; CHECK-BIN-NEXT:    (i32.const 12)
 ;; CHECK-BIN-NEXT:   )
 ;; CHECK-BIN-NEXT:  )
 ;; CHECK-BIN-NEXT:  (drop
 ;; CHECK-BIN-NEXT:   (i32.load8_s $memory3
 ;; CHECK-BIN-NEXT:    (i32.const 12)
 ;; CHECK-BIN-NEXT:   )
 ;; CHECK-BIN-NEXT:  )
 ;; CHECK-BIN-NEXT:  (drop
 ;; CHECK-BIN-NEXT:   (i32.load16_u $memory1
 ;; CHECK-BIN-NEXT:    (i32.const 12)
 ;; CHECK-BIN-NEXT:   )
 ;; CHECK-BIN-NEXT:  )
 ;; CHECK-BIN-NEXT:  (drop
 ;; CHECK-BIN-NEXT:   (i32.load16_u $memory1
 ;; CHECK-BIN-NEXT:    (i32.const 12)
 ;; CHECK-BIN-NEXT:   )
 ;; CHECK-BIN-NEXT:  )
 ;; CHECK-BIN-NEXT:  (drop
 ;; CHECK-BIN-NEXT:   (i32.load8_u $memory2
 ;; CHECK-BIN-NEXT:    (i32.const 12)
 ;; CHECK-BIN-NEXT:   )
 ;; CHECK-BIN-NEXT:  )
 ;; CHECK-BIN-NEXT:  (drop
 ;; CHECK-BIN-NEXT:   (i32.load8_u $memory2
 ;; CHECK-BIN-NEXT:    (i32.const 12)
 ;; CHECK-BIN-NEXT:   )
 ;; CHECK-BIN-NEXT:  )
 ;; CHECK-BIN-NEXT: )
 (func $loads
  (drop
   (i32.load $memory1
    (i32.const 12)
   )
  )
  (drop
   (i32.load $memory3
    (i32.const 12)
   )
  )
  (drop
   (i32.load16_s $memory2
    (i32.const 12)
   )
  )
  (drop
   (i32.load16_s $memory2
    (i32.const 12)
   )
  )
  (drop
   (i32.load8_s $memory3
    (i32.const 12)
   )
  )
  (drop
   (i32.load8_s $memory3
    (i32.const 12)
   )
  )
  (drop
   (i32.load16_u $memory1
    (i32.const 12)
   )
  )
  (drop
   (i32.load16_u $memory1
    (i32.const 12)
   )
  )
  (drop
   (i32.load8_u $memory2
    (i32.const 12)
   )
  )
  (drop
   (i32.load8_u $memory2
    (i32.const 12)
   )
  )
 )

 ;; CHECK-TEXT:      (func $stores (type $none_=>_none)
 ;; CHECK-TEXT-NEXT:  (i32.store $memory1
 ;; CHECK-TEXT-NEXT:   (i32.const 12)
 ;; CHECK-TEXT-NEXT:   (i32.const 115)
 ;; CHECK-TEXT-NEXT:  )
 ;; CHECK-TEXT-NEXT:  (i32.store $memory1
 ;; CHECK-TEXT-NEXT:   (i32.const 12)
 ;; CHECK-TEXT-NEXT:   (i32.const 115)
 ;; CHECK-TEXT-NEXT:  )
 ;; CHECK-TEXT-NEXT:  (i32.store16 $memory2
 ;; CHECK-TEXT-NEXT:   (i32.const 20)
 ;; CHECK-TEXT-NEXT:   (i32.const 31353)
 ;; CHECK-TEXT-NEXT:  )
 ;; CHECK-TEXT-NEXT:  (i32.store16 $importedMemory
 ;; CHECK-TEXT-NEXT:   (i32.const 20)
 ;; CHECK-TEXT-NEXT:   (i32.const 31353)
 ;; CHECK-TEXT-NEXT:  )
 ;; CHECK-TEXT-NEXT:  (i32.store8 $memory3
 ;; CHECK-TEXT-NEXT:   (i32.const 23)
 ;; CHECK-TEXT-NEXT:   (i32.const 120)
 ;; CHECK-TEXT-NEXT:  )
 ;; CHECK-TEXT-NEXT:  (i32.store8 $memory3
 ;; CHECK-TEXT-NEXT:   (i32.const 23)
 ;; CHECK-TEXT-NEXT:   (i32.const 120)
 ;; CHECK-TEXT-NEXT:  )
 ;; CHECK-TEXT-NEXT: )
 ;; CHECK-BIN:      (func $stores (type $none_=>_none)
 ;; CHECK-BIN-NEXT:  (i32.store $memory1
 ;; CHECK-BIN-NEXT:   (i32.const 12)
 ;; CHECK-BIN-NEXT:   (i32.const 115)
 ;; CHECK-BIN-NEXT:  )
 ;; CHECK-BIN-NEXT:  (i32.store $memory1
 ;; CHECK-BIN-NEXT:   (i32.const 12)
 ;; CHECK-BIN-NEXT:   (i32.const 115)
 ;; CHECK-BIN-NEXT:  )
 ;; CHECK-BIN-NEXT:  (i32.store16 $memory2
 ;; CHECK-BIN-NEXT:   (i32.const 20)
 ;; CHECK-BIN-NEXT:   (i32.const 31353)
 ;; CHECK-BIN-NEXT:  )
 ;; CHECK-BIN-NEXT:  (i32.store16 $importedMemory
 ;; CHECK-BIN-NEXT:   (i32.const 20)
 ;; CHECK-BIN-NEXT:   (i32.const 31353)
 ;; CHECK-BIN-NEXT:  )
 ;; CHECK-BIN-NEXT:  (i32.store8 $memory3
 ;; CHECK-BIN-NEXT:   (i32.const 23)
 ;; CHECK-BIN-NEXT:   (i32.const 120)
 ;; CHECK-BIN-NEXT:  )
 ;; CHECK-BIN-NEXT:  (i32.store8 $memory3
 ;; CHECK-BIN-NEXT:   (i32.const 23)
 ;; CHECK-BIN-NEXT:   (i32.const 120)
 ;; CHECK-BIN-NEXT:  )
 ;; CHECK-BIN-NEXT: )
 (func $stores
  (i32.store $memory1
   (i32.const 12)
   (i32.const 115)
  )
  (i32.store $memory1
   (i32.const 12)
   (i32.const 115)
  )
  (i32.store16 $memory2
   (i32.const 20)
   (i32.const 31353)
  )
  (i32.store16 $importedMemory
   (i32.const 20)
   (i32.const 31353)
  )
  (i32.store8 $memory3
   (i32.const 23)
   (i32.const 120)
  )
  (i32.store8 $memory3
   (i32.const 23)
   (i32.const 120)
  )
 )
)
;; CHECK-BIN-NODEBUG:      (type $0 (func))

;; CHECK-BIN-NODEBUG:      (type $1 (func (result i32)))

;; CHECK-BIN-NODEBUG:      (import "env" "memory" (memory $mimport$0 1 1))

;; CHECK-BIN-NODEBUG:      (memory $0 1 500)

;; CHECK-BIN-NODEBUG:      (memory $1 1 800)

;; CHECK-BIN-NODEBUG:      (memory $2 1 400)

;; CHECK-BIN-NODEBUG:      (data $0 (i32.const 0) "abcd")

;; CHECK-BIN-NODEBUG:      (func $0 (type $0)
;; CHECK-BIN-NODEBUG-NEXT:  (memory.fill $1
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 0)
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 1)
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 2)
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT: )

;; CHECK-BIN-NODEBUG:      (func $1 (type $0)
;; CHECK-BIN-NODEBUG-NEXT:  (memory.copy $1 $2
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 512)
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 0)
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 12)
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT: )

;; CHECK-BIN-NODEBUG:      (func $2 (type $0)
;; CHECK-BIN-NODEBUG-NEXT:  (memory.init $0 $0
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 0)
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 0)
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 45)
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT: )

;; CHECK-BIN-NODEBUG:      (func $3 (type $1) (result i32)
;; CHECK-BIN-NODEBUG-NEXT:  (memory.grow $2
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 10)
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT: )

;; CHECK-BIN-NODEBUG:      (func $4 (type $1) (result i32)
;; CHECK-BIN-NODEBUG-NEXT:  (memory.size $2)
;; CHECK-BIN-NODEBUG-NEXT: )

;; CHECK-BIN-NODEBUG:      (func $5 (type $0)
;; CHECK-BIN-NODEBUG-NEXT:  (drop
;; CHECK-BIN-NODEBUG-NEXT:   (i32.load $0
;; CHECK-BIN-NODEBUG-NEXT:    (i32.const 12)
;; CHECK-BIN-NODEBUG-NEXT:   )
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT:  (drop
;; CHECK-BIN-NODEBUG-NEXT:   (i32.load $2
;; CHECK-BIN-NODEBUG-NEXT:    (i32.const 12)
;; CHECK-BIN-NODEBUG-NEXT:   )
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT:  (drop
;; CHECK-BIN-NODEBUG-NEXT:   (i32.load16_s $1
;; CHECK-BIN-NODEBUG-NEXT:    (i32.const 12)
;; CHECK-BIN-NODEBUG-NEXT:   )
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT:  (drop
;; CHECK-BIN-NODEBUG-NEXT:   (i32.load16_s $1
;; CHECK-BIN-NODEBUG-NEXT:    (i32.const 12)
;; CHECK-BIN-NODEBUG-NEXT:   )
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT:  (drop
;; CHECK-BIN-NODEBUG-NEXT:   (i32.load8_s $2
;; CHECK-BIN-NODEBUG-NEXT:    (i32.const 12)
;; CHECK-BIN-NODEBUG-NEXT:   )
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT:  (drop
;; CHECK-BIN-NODEBUG-NEXT:   (i32.load8_s $2
;; CHECK-BIN-NODEBUG-NEXT:    (i32.const 12)
;; CHECK-BIN-NODEBUG-NEXT:   )
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT:  (drop
;; CHECK-BIN-NODEBUG-NEXT:   (i32.load16_u $0
;; CHECK-BIN-NODEBUG-NEXT:    (i32.const 12)
;; CHECK-BIN-NODEBUG-NEXT:   )
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT:  (drop
;; CHECK-BIN-NODEBUG-NEXT:   (i32.load16_u $0
;; CHECK-BIN-NODEBUG-NEXT:    (i32.const 12)
;; CHECK-BIN-NODEBUG-NEXT:   )
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT:  (drop
;; CHECK-BIN-NODEBUG-NEXT:   (i32.load8_u $1
;; CHECK-BIN-NODEBUG-NEXT:    (i32.const 12)
;; CHECK-BIN-NODEBUG-NEXT:   )
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT:  (drop
;; CHECK-BIN-NODEBUG-NEXT:   (i32.load8_u $1
;; CHECK-BIN-NODEBUG-NEXT:    (i32.const 12)
;; CHECK-BIN-NODEBUG-NEXT:   )
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT: )

;; CHECK-BIN-NODEBUG:      (func $6 (type $0)
;; CHECK-BIN-NODEBUG-NEXT:  (i32.store $0
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 12)
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 115)
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT:  (i32.store $0
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 12)
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 115)
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT:  (i32.store16 $1
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 20)
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 31353)
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT:  (i32.store16 $mimport$0
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 20)
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 31353)
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT:  (i32.store8 $2
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 23)
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 120)
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT:  (i32.store8 $2
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 23)
;; CHECK-BIN-NODEBUG-NEXT:   (i32.const 120)
;; CHECK-BIN-NODEBUG-NEXT:  )
;; CHECK-BIN-NODEBUG-NEXT: )
