PUBLISH = index.html xxml.el xxml.tar.gz
DISTRIB = ChangeLog Makefile README THANKS xxml.el

publish: $(PUBLISH)
	chmod 644 $(PUBLISH)
	rsync -e ssh -auzv $(PUBLISH) bor:w/xxml/
	ssh bor ls -Llt w/xxml
	rm index.html xxml.tar.gz

index.html: README
	python $(HOME)/webert-0.0/Webert/htmlpage.py README index.html

xxml.tar.gz: $(DISTRIB)
	elc xxml.el
	rm xxml.elc
	tar cfvvz xxml.tar.gz $(DISTRIB)
