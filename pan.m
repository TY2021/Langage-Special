#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC :init: */
	case 3: // STATE 1 - Diner2.pml:30 - [((proc<5))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		if (!((((P1 *)this)->proc<5)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - Diner2.pml:31 - [(run philosopher(proc))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		if (!(addproc(II, 1, 0, ((P1 *)this)->proc)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - Diner2.pml:31 - [proc = (proc+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][3] = 1;
		(trpt+1)->bup.oval = ((P1 *)this)->proc;
		((P1 *)this)->proc = (((P1 *)this)->proc+1);
#ifdef VAR_RANGES
		logval(":init::proc", ((P1 *)this)->proc);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 4 - Diner2.pml:32 - [((proc>=5))] (0:0:1 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (!((((P1 *)this)->proc>=5)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: proc */  (trpt+1)->bup.oval = ((P1 *)this)->proc;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)this)->proc = 0;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 9 - Diner2.pml:35 - [-end-] (0:0:0 - 3)
		IfNotBlocked
		reached[1][9] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC philosopher */
	case 8: // STATE 1 - Diner2.pml:15 - [((((id%2)==0)&&(fork[right]!=BUSY)))] (12:0:4 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		if (!((((((P0 *)this)->id%2)==0)&&(now.fork[ Index(((P0 *)this)->right, 5) ]!=1))))
			continue;
		/* merge: fork[right] = BUSY(12, 2, 12) */
		reached[0][2] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.fork[ Index(((P0 *)this)->right, 5) ];
		now.fork[ Index(((P0 *)this)->right, 5) ] = 1;
#ifdef VAR_RANGES
		logval("fork[philosopher:right]", now.fork[ Index(((P0 *)this)->right, 5) ]);
#endif
		;
		/* merge: fork[left] = BUSY(12, 3, 12) */
		reached[0][3] = 1;
		(trpt+1)->bup.ovals[1] = now.fork[ Index(((P0 *)this)->left, 5) ];
		now.fork[ Index(((P0 *)this)->left, 5) ] = 1;
#ifdef VAR_RANGES
		logval("fork[philosopher:left]", now.fork[ Index(((P0 *)this)->left, 5) ]);
#endif
		;
		/* merge: .(goto)(12, 8, 12) */
		reached[0][8] = 1;
		;
		/* merge: state = EATING(12, 10, 12) */
		reached[0][10] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->state;
		((P0 *)this)->state = 5;
#ifdef VAR_RANGES
		logval("philosopher:state", ((P0 *)this)->state);
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: state */  
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->state = 0;
		/* merge: printf('Philosopher%d is eating.\\n',id)(12, 11, 12) */
		reached[0][11] = 1;
		Printf("Philosopher%d is eating.\n", ((P0 *)this)->id);
		_m = 3; goto P999; /* 5 */
	case 9: // STATE 8 - Diner2.pml:18 - [.(goto)] (0:12:2 - 2)
		IfNotBlocked
		reached[0][8] = 1;
		;
		/* merge: state = EATING(12, 10, 12) */
		reached[0][10] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->state;
		((P0 *)this)->state = 5;
#ifdef VAR_RANGES
		logval("philosopher:state", ((P0 *)this)->state);
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: state */  
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->state = 0;
		/* merge: printf('Philosopher%d is eating.\\n',id)(12, 11, 12) */
		reached[0][11] = 1;
		Printf("Philosopher%d is eating.\n", ((P0 *)this)->id);
		_m = 3; goto P999; /* 2 */
	case 10: // STATE 4 - Diner2.pml:16 - [((((id%2)!=0)&&(fork[left]!=BUSY)))] (12:0:4 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		if (!((((((P0 *)this)->id%2)!=0)&&(now.fork[ Index(((P0 *)this)->left, 5) ]!=1))))
			continue;
		/* merge: fork[left] = BUSY(12, 5, 12) */
		reached[0][5] = 1;
		(trpt+1)->bup.ovals = grab_ints(4);
		(trpt+1)->bup.ovals[0] = now.fork[ Index(((P0 *)this)->left, 5) ];
		now.fork[ Index(((P0 *)this)->left, 5) ] = 1;
#ifdef VAR_RANGES
		logval("fork[philosopher:left]", now.fork[ Index(((P0 *)this)->left, 5) ]);
#endif
		;
		/* merge: fork[right] = BUSY(12, 6, 12) */
		reached[0][6] = 1;
		(trpt+1)->bup.ovals[1] = now.fork[ Index(((P0 *)this)->right, 5) ];
		now.fork[ Index(((P0 *)this)->right, 5) ] = 1;
#ifdef VAR_RANGES
		logval("fork[philosopher:right]", now.fork[ Index(((P0 *)this)->right, 5) ]);
#endif
		;
		/* merge: .(goto)(12, 8, 12) */
		reached[0][8] = 1;
		;
		/* merge: state = EATING(12, 10, 12) */
		reached[0][10] = 1;
		(trpt+1)->bup.ovals[2] = ((P0 *)this)->state;
		((P0 *)this)->state = 5;
#ifdef VAR_RANGES
		logval("philosopher:state", ((P0 *)this)->state);
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: state */  
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->state = 0;
		/* merge: printf('Philosopher%d is eating.\\n',id)(12, 11, 12) */
		reached[0][11] = 1;
		Printf("Philosopher%d is eating.\n", ((P0 *)this)->id);
		_m = 3; goto P999; /* 5 */
	case 11: // STATE 12 - Diner2.pml:21 - [fork[left] = FREE] (0:0:1 - 1)
		IfNotBlocked
		reached[0][12] = 1;
		(trpt+1)->bup.oval = now.fork[ Index(((P0 *)this)->left, 5) ];
		now.fork[ Index(((P0 *)this)->left, 5) ] = 2;
#ifdef VAR_RANGES
		logval("fork[philosopher:left]", now.fork[ Index(((P0 *)this)->left, 5) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 13 - Diner2.pml:22 - [fork[right] = FREE] (0:0:1 - 1)
		IfNotBlocked
		reached[0][13] = 1;
		(trpt+1)->bup.oval = now.fork[ Index(((P0 *)this)->right, 5) ];
		now.fork[ Index(((P0 *)this)->right, 5) ] = 2;
#ifdef VAR_RANGES
		logval("fork[philosopher:right]", now.fork[ Index(((P0 *)this)->right, 5) ]);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 14 - Diner2.pml:23 - [state = THINKING] (0:0:2 - 1)
		IfNotBlocked
		reached[0][14] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->state;
		((P0 *)this)->state = 4;
#ifdef VAR_RANGES
		logval("philosopher:state", ((P0 *)this)->state);
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: state */  
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->state = 0;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 18 - Diner2.pml:25 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][18] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

