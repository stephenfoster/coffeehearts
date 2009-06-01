
SHELL = /bin/sh

#### Start of system configuration section. ####

srcdir = .
topdir = /usr/lib/ruby/1.8/i486-linux
hdrdir = $(topdir)
VPATH = $(srcdir):$(topdir):$(hdrdir)
prefix = $(DESTDIR)/usr
exec_prefix = $(prefix)
sitedir = $(DESTDIR)/usr/local/lib/site_ruby
rubylibdir = $(libdir)/ruby/$(ruby_version)
docdir = $(datarootdir)/doc/$(PACKAGE)
dvidir = $(docdir)
datarootdir = $(prefix)/share
archdir = $(rubylibdir)/$(arch)
sbindir = $(exec_prefix)/sbin
psdir = $(docdir)
localedir = $(datarootdir)/locale
htmldir = $(docdir)
datadir = $(datarootdir)
includedir = $(prefix)/include
infodir = $(prefix)/share/info
sysconfdir = $(DESTDIR)/etc
mandir = $(prefix)/share/man
libdir = $(exec_prefix)/lib
sharedstatedir = $(prefix)/com
oldincludedir = $(DESTDIR)/usr/include
pdfdir = $(docdir)
sitearchdir = $(sitelibdir)/$(sitearch)
bindir = $(exec_prefix)/bin
localstatedir = $(DESTDIR)/var
sitelibdir = $(sitedir)/$(ruby_version)
libexecdir = $(prefix)/lib/ruby1.8

CC = cc
LIBRUBY = $(LIBRUBY_SO)
LIBRUBY_A = lib$(RUBY_SO_NAME)-static.a
LIBRUBYARG_SHARED = -l$(RUBY_SO_NAME)
LIBRUBYARG_STATIC = -l$(RUBY_SO_NAME)-static

RUBY_EXTCONF_H = 
CFLAGS   =  -fPIC -fno-strict-aliasing -g -g -O2  -fPIC -D_FILE_OFFSET_BITS=64 
INCFLAGS = -I. -I$(topdir) -I$(hdrdir) -I$(srcdir)
CPPFLAGS =  
CXXFLAGS = $(CFLAGS) 
DLDFLAGS = -L. -Wl,-Bsymbolic-functions -rdynamic -Wl,-export-dynamic  
LDSHARED = $(CC) -shared
AR = ar
EXEEXT = 

RUBY_INSTALL_NAME = ruby1.8
RUBY_SO_NAME = ruby1.8
arch = i486-linux
sitearch = i486-linux
ruby_version = 1.8
ruby = /usr/bin/ruby1.8
RUBY = $(ruby)
RM = rm -f
MAKEDIRS = mkdir -p
INSTALL = /usr/bin/install -c
INSTALL_PROG = $(INSTALL) -m 0755
INSTALL_DATA = $(INSTALL) -m 644
COPY = cp

#### End of system configuration section. ####

preload = 

libpath = . $(libdir)
LIBPATH =  -L"." -L"$(libdir)"
DEFFILE = 

CLEANFILES = mkmf.log
DISTCLEANFILES = 

extout = 
extout_prefix = 
target_prefix = 
LOCAL_LIBS = 
LIBS = $(LIBRUBYARG_SHARED)  -lpthread -ldl -lcrypt -lm   -lc
SRCS = q_filtered_query.c stem_ISO_8859_1_spanish.c global.c stem_UTF_8_italian.c stem_UTF_8_portuguese.c stem_ISO_8859_1_dutch.c array.c stem_ISO_8859_1_finnish.c q_wildcard.c stem_UTF_8_english.c api.c r_index.c hashset.c stem_ISO_8859_1_german.c utilities.c stem_UTF_8_spanish.c stem_ISO_8859_1_danish.c q_match_all.c stem_UTF_8_german.c compound_io.c q_prefix.c stopwords.c stem_ISO_8859_1_italian.c bitvector.c r_analysis.c stem_UTF_8_porter.c stem_ISO_8859_1_norwegian.c stem_UTF_8_norwegian.c stem_ISO_8859_1_swedish.c hash.c stem_UTF_8_swedish.c fs_store.c stem_UTF_8_finnish.c stem_UTF_8_danish.c ferret.c term_vectors.c posh.c helper.c mempool.c r_utils.c document.c stem_KOI8_R_russian.c r_search.c libstemmer.c stem_ISO_8859_1_portuguese.c r_qparser.c stem_ISO_8859_1_french.c q_parser.c analysis.c r_store.c q_phrase.c q_term.c filter.c q_span.c multimapper.c stem_UTF_8_french.c index.c similarity.c stem_UTF_8_russian.c q_fuzzy.c search.c stem_ISO_8859_1_porter.c ram_store.c except.c q_range.c sort.c q_multi_term.c q_const_score.c q_boolean.c priorityqueue.c store.c stem_ISO_8859_1_english.c stem_UTF_8_dutch.c
OBJS = q_filtered_query.o stem_ISO_8859_1_spanish.o global.o stem_UTF_8_italian.o stem_UTF_8_portuguese.o stem_ISO_8859_1_dutch.o array.o stem_ISO_8859_1_finnish.o q_wildcard.o stem_UTF_8_english.o api.o r_index.o hashset.o stem_ISO_8859_1_german.o utilities.o stem_UTF_8_spanish.o stem_ISO_8859_1_danish.o q_match_all.o stem_UTF_8_german.o compound_io.o q_prefix.o stopwords.o stem_ISO_8859_1_italian.o bitvector.o r_analysis.o stem_UTF_8_porter.o stem_ISO_8859_1_norwegian.o stem_UTF_8_norwegian.o stem_ISO_8859_1_swedish.o hash.o stem_UTF_8_swedish.o fs_store.o stem_UTF_8_finnish.o stem_UTF_8_danish.o ferret.o term_vectors.o posh.o helper.o mempool.o r_utils.o document.o stem_KOI8_R_russian.o r_search.o libstemmer.o stem_ISO_8859_1_portuguese.o r_qparser.o stem_ISO_8859_1_french.o q_parser.o analysis.o r_store.o q_phrase.o q_term.o filter.o q_span.o multimapper.o stem_UTF_8_french.o index.o similarity.o stem_UTF_8_russian.o q_fuzzy.o search.o stem_ISO_8859_1_porter.o ram_store.o except.o q_range.o sort.o q_multi_term.o q_const_score.o q_boolean.o priorityqueue.o store.o stem_ISO_8859_1_english.o stem_UTF_8_dutch.o
TARGET = ferret_ext
DLLIB = $(TARGET).so
EXTSTATIC = 
STATIC_LIB = 

RUBYCOMMONDIR = $(sitedir)$(target_prefix)
RUBYLIBDIR = /home/stephen/coffeehearts/vendor/gems/ferret-0.11.6/lib$(target_prefix)
RUBYARCHDIR = /home/stephen/coffeehearts/vendor/gems/ferret-0.11.6/lib$(target_prefix)

TARGET_SO     = $(DLLIB)
CLEANLIBS     = $(TARGET).so $(TARGET).il? $(TARGET).tds $(TARGET).map
CLEANOBJS     = *.o *.a *.s[ol] *.pdb *.exp *.bak

all:		$(DLLIB)
static:		$(STATIC_LIB)

clean:
		@-$(RM) $(CLEANLIBS) $(CLEANOBJS) $(CLEANFILES)

distclean:	clean
		@-$(RM) Makefile $(RUBY_EXTCONF_H) conftest.* mkmf.log
		@-$(RM) core ruby$(EXEEXT) *~ $(DISTCLEANFILES)

realclean:	distclean
install: install-so install-rb

install-so: $(RUBYARCHDIR)
install-so: $(RUBYARCHDIR)/$(DLLIB)
$(RUBYARCHDIR)/$(DLLIB): $(DLLIB)
	$(INSTALL_PROG) $(DLLIB) $(RUBYARCHDIR)
install-rb: pre-install-rb install-rb-default
install-rb-default: pre-install-rb-default
pre-install-rb: Makefile
pre-install-rb-default: Makefile
$(RUBYARCHDIR):
	$(MAKEDIRS) $@

site-install: site-install-so site-install-rb
site-install-so: install-so
site-install-rb: install-rb

.SUFFIXES: .c .m .cc .cxx .cpp .C .o

.cc.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.cxx.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.cpp.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.C.o:
	$(CXX) $(INCFLAGS) $(CPPFLAGS) $(CXXFLAGS) -c $<

.c.o:
	$(CC) $(INCFLAGS) $(CPPFLAGS) $(CFLAGS) -c $<

$(DLLIB): $(OBJS)
	@-$(RM) $@
	$(LDSHARED) -o $@ $(OBJS) $(LIBPATH) $(DLDFLAGS) $(LOCAL_LIBS) $(LIBS)



$(OBJS): ruby.h defines.h
