# Concurrent Objects (p.45->)

Behaviour of concurrent object are best described through their safety and liveness properties. Similar to correctness and progress, which could be synonymous. 

Three correctness conditionals:

### Quiescent consistency

Okay for software/apps that require high performance with the tradeoff being less strict constraints on the object behavior.

### Sequential Consistency

Stronger condition whereas the condition is closer to the hardware interface.

### Linearizability 

Is the strongest one of the three, describing systems on a higher-level made up from linearizable components. 

These components provide a diverse set of guarantees for progress such as some components are blocking, delaying the thread and other threads, whilst some are nonblocking, whereas the delay of a thread does not delay the other threads or components.

## Concurrency and Correctness


** What does it mean for a concurrent object to be correct?**

Easier to understand concurrent behaviour of objects if they are mapped from their current execution to sequiential ones.

I.e a FIFO queue with 3 threads, enqueuing and dequeuing interchangeably (albeit we need 1 enqueuer and dequeuer). 

FIFO queue with locking at a higher level also points out a flaw in concurrency if to reason about. Objects need a primitive syncronisation and concurrency model rather than on method level, to make it easier to follow concurrent laws.

##### Amdahl's law
Amdahl's law says that concurrent objects whose methods hold exclusive locks, are less desireable than ones with finer-grained locking or no-locking at all. This means that the design of the data-structure over-rule exlusive locking on a higher level. 

```java

class WaitFreeQueue<T> {
    volatile int head = 0, tail = 0;
    T[] items;
    public waitFreeQueue(int capacity) {
        items = (T[]) new Object[capacity];
    }
    public void enqueue(T x) throws FullExecption {
        if(tail - head == items.length) {
            throw new FullException();
        }
        items[tail % items.length] = x;
        tail++;
    }
    public T dequeue throws EmptyException {
        if(tail - head == 0) {
            throw new EmptyException();
        }
        T x = items[head % items.length];
        head++;
        return x;
    }
}
```

So the change here is to have a circular buffer as a queue in exhange for a locked queue implementation. Baller af.


## Sequential Objects

An object in C++ / Java is container of data. Methods manipulate the data. 

Precondition means the state the object is before the method is called, or behaviour changed. 

Postcondition describes the state and return value of the object once the method returns.

A change of an objects state is sometimes called an **side-effect**.

For instance, in FIFO Q:

Enqueueing, the state is a sequence of items | empty. If the state is a sequence, q(precondition), then a call to enq(z) leaves the state of the queue as q*z, where * means concatination.

If the queue object is non-empty(precondition), say a*q, then deq removes and returns the first element in the sequence (postcondition). This leaves the queue in state q (side-effect). If the queue object is empty, a dequeue operation will throw an emptyException, which leaves the postcondition as unchanged.

This style of documentation called a **sequential specification**, is so familar that it is to easy to overlook how elegant and powerful it is. The length of the object's docs is linear (plain /) in the number of methods, because each method can be described in isolation.

There's various of ways methods could interact, which is charactarized as the side-effects it produces on the state of an object.

The objects documentation descibes the object state before and after each call. Describing any intermediate states is okay, since we know that a method call is under progress.

Defining objects in terms of preconditions and postconditions (documentation), is legit af in a sequential model of computation where a signle thread manipulates a series of objects.

In multi-threaded tries, this is not it, as the core principles of conditions falls apart :( postmalone). 

For instance, if a method of an object can be invoked concurrently in a multiple thread implementation, then the method could overlap in time, and order is not essential anymore. (We can't talk bout it :/ )

For instance again, if a and b is enqueued while they are overlapping in time, which will be dequeued first? We cannot continue to speak about isolation because the context of the object has changed, i.e its level of abstraction.

Even the notion of a state becomes blurry once we cannot isolate the instance, as we cannot describe the state between method calls that are concurrent. For single-threaded programs, even a meaningful state can be sketched out when we assume a meaningful state between two method calls. For the concurrent model and object, we cannot do that. Overlapping methods could be in place for every time and instant, such that the obejct may never be between these two states. This means that we must be prepared to encounter a state that reflects the incomplete effect of another concurrent method call to an object. Which isn't the case for single-threaded programs.

## Quiescent Consistency

One way to develop an intuition of concurrent objects and their expected behaviour is to do case studies. Method calls take time, a call's interval starts with an invocation event and finishes with a response event. Method calls by concurrent threads may overlap, while they are singled out in sequential order.

We say an event is **pending** if an invocation has happened, but no response event has yet.

### Principles <3


#### 3.1.1 Method calls should appear to appen in a sequiential order style - 1 at a time, like entering a bar

By itself itself, this principle is usually too weak to be useful. For example, it permits reads always to return the initial state, even in sequential executions.

Here is a slightly stronger conidition. An object is quienscent if it has no pending method calls.

#### 3.3.2 Method calls seperated by a period of quiescence should appear to take effect in their real time

For example, declaring variables A and B, concurrently enqueuing x and y in a FIFO queue. This queue becomes quienscent consistency. Informally, it says that any time an object becomes quienscent, then the execution so far is equivalent to some sequiential execution of the completed calls.

As an example, of this conditon on an object, we say we have a shared counter. A quiescently consistent shared counter would return numbers, but not necessarily in the order of the getAndIncrement invocation. It doesn't duplicate or omit a number, it is consistent with somewhat like a musical-chars game: at any point, the music might stop, that is, the state could become quiescent. At that point, the pending method call must return an index, so all the indices together meet the specifiaction of a sequential counter, implying no duploicated or omitted numbers.

In other words, a quienscently consistent counter is an index distributed mechasnism, useful as a "loop conter" in programs that do not care about the order in which indexes are issued.

## Remarks

Which circumstances does quienscent consistency require one method call to block? Never

A method is total if it is defined for every object state; otherwise partial.

enqueue and dequeue is total in a sequential FIFO, since its effects are defined in every queue state, but deq is partial since its effects are defined only for nonempty queues.

In any concurrent execution, for any pending invocation of a total method, there exists a quenscentialy consistent response. This observation does not mean that it is easy (or even possible) to figure out what that response is, but only that the correctness condition itself does not stand in the way. We say that quiscent consistency is a nonblocking correctness condition.

A correctness property P is compositional if, whenever each object in the system satisfies P, the system as a whole satisfies P. Compositionality is important in large systesm, because any sufficient system is modular.

Quiescense consistency is compositional, so we can compose quienscical components out of consistent objects (self-absorbant layering).

## Sequential Consistency

The order in which a signle thread issues method calls is called its program order. 

### Principles <3

#### Method Calls should appear to take effect in program order


This principle ensures that purely sequential computations behave the way we would expect. Together, Prinicples 3.3.1 and 3.4.1 define a correctness property called sequential consistency, which is widely used in in the litterature on mulitprocessor synchronisation. (one at a time, following control flow) Sequiential consistency requires that method calls act if they occured in a sequential order consistent with program order.

## Remarks

Quiescent consistency and sequential consistency are incomperable, as there can exist sequentially consistent executions that are not quiescently consistent and vv. Quiescent consistency does not neccarily preserve program order, and sequential consistency is unaffected by queiescnet periods.

