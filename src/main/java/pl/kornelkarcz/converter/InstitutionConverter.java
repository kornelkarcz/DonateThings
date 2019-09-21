package pl.kornelkarcz.converter;

import lombok.RequiredArgsConstructor;
import org.springframework.core.convert.converter.Converter;
import pl.kornelkarcz.model.Institution;
import pl.kornelkarcz.service.InstitutionService;

import java.util.Optional;

@RequiredArgsConstructor
public class InstitutionConverter implements Converter<String, Optional<Institution>> {

    private final InstitutionService institutionService;

    @Override
    public Optional<Institution> convert(String s) {
        return institutionService.findById(Long.parseLong(s));
    }
}
